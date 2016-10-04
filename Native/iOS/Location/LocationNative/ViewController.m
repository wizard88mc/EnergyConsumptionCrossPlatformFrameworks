//
//  ViewController.m
//  LocationNative
//
//  Created by Matteo Ciman on 23/06/14.
//  Copyright (c) 2014 Matteo Ciman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    locationManager = [[CLLocationManager alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getCurrentLocation:(UIButton *)sender
{
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error getting your location" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"New location at didUpdateLocations");
    CLLocation *currentLocation = [locations lastObject];
    
    if (self.printData.on)
    {
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.5f", currentLocation.coordinate.latitude];
        self.longitudeLabel.text = [NSString stringWithFormat:@"%.5f", currentLocation.coordinate.longitude];
    }
    
}


@end
