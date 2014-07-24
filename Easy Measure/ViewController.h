//
//  ViewController.h
//  Easy Measure
//
//  Created by asaf halili on 22/04/13.
//  Copyright (c) 2013 asaf halili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "savedInfo.h"

@interface ViewController : UIViewController <UIAccelerometerDelegate>
{
    int currentPoint;
    UIAccelerometer *accelerometer;
} 

-(IBAction) increaseRuler:(id) sender;
-(IBAction) decreaseRuler:(id) sender;

@property (nonatomic, retain) UIAccelerometer *accelerometer;

@end
