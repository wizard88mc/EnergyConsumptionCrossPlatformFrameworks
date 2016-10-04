//
//  ViewController.h
//  CompassNative
//
//  Created by Matteo Ciman on 28/08/14.
//  Copyright (c) 2014 Matteo Ciman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) NSDate *lastUpdate;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISwitch *switchData;
@property (weak, nonatomic) IBOutlet UISwitch *switchTime;

@end
