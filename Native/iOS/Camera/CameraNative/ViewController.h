//
//  ViewController.h
//  CameraNative
//
//  Created by Matteo Ciman on 23/06/14.
//  Copyright (c) 2014 Matteo Ciman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
