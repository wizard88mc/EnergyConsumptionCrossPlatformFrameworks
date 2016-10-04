//
//  ViewController.h
//  AccelerometerNative
//
//  Created by Matteo Ciman on 20/06/14.
//  Copyright (c) 2014 Matteo Ciman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *accX;
@property (weak, nonatomic) IBOutlet UILabel *accY;
@property (weak, nonatomic) IBOutlet UILabel *accZ;
@property (weak, nonatomic) IBOutlet UILabel *delta;

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (strong, nonatomic) NSDate *lastUpdate;

@property (weak, nonatomic) IBOutlet UISwitch *printData;

@property (weak, nonatomic) IBOutlet UISwitch *printDelta;
@end
