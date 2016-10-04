//
//  ViewController.m
//  AccelerometerNative
//
//  Created by Matteo Ciman on 20/06/14.
//  Copyright (c) 2014 Matteo Ciman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor: [UIColor blackColor]];
	
    self.motionManager = [[CMMotionManager alloc] init];
    self.lastUpdate = NULL;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startOrStopRecordData:(UIButton *)sender
{
    self.motionManager.accelerometerUpdateInterval = .500; //.10 .25 .50
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        
        [self outputAccelerationData:accelerometerData.acceleration];
        if (error) {
            NSLog(@"%@", error);
        }
    }];

}

-(void)outputAccelerationData:(CMAcceleration)acceleration
{
 
    if (self.printData.on) {
        self.accX.text = [NSString stringWithFormat:@"%.5f", acceleration.x];
        self.accY.text = [NSString stringWithFormat:@"%.5f", acceleration.y];
        self.accZ.text = [NSString stringWithFormat:@"%.5f", acceleration.z];
        
        if (self.printDelta.on) {
            if (self.lastUpdate != NULL) {
                NSDate *currentTime = [NSDate date];
                NSTimeInterval interval = [currentTime timeIntervalSinceDate:self.lastUpdate];
                self.delta.text = [NSString stringWithFormat:@"%f", interval * 1000];
            }
            self.lastUpdate = [NSDate date];
        }
    }
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
