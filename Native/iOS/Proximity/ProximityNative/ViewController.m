//
//  ViewController.m
//  ProximityNative
//
//  Created by Matteo Ciman on 23/06/14.
//  Copyright (c) 2014 Matteo Ciman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UIDevice *device = [UIDevice currentDevice];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityChanged:) name:@"UIDeviceProximityStateDidChangeNotification" object:device];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startRecordData:(id)sender
{
    UIDevice *device = [UIDevice currentDevice];
    device.proximityMonitoringEnabled = YES;
}

-(void)proximityChanged:(NSNotification *)notification
{
    UIDevice *device = [UIDevice currentDevice];
    if (self.printData.on) {
        self.proximityLabel.text = device.proximityState ? @"YES": @"NO";
    }
}
@end
