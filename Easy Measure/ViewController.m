//
//  ViewController.m
//  Easy Measure
//
//  Created by asaf halili on 22/04/13.
//  Copyright (c) 2013 asaf halili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#define kFilteringFactor 0.1
static UIAccelerationValue rollingY=0;

@synthesize accelerometer;

- (void)viewDidLoad
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    NSLog(@"%f",screenSize.height);
    currentPoint = [savedInfo currentPoint];
    int rulerStart = [savedInfo currentPoint] - [savedInfo rulerHeight] + 1;
    NSLog(@"%d %d",rulerStart,currentPoint);
    int index = 1;
    for(int i=rulerStart;i<=currentPoint;i++)
    {
        
        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,(-5+(index-1)*6.5),100,20)];
        numLabel.backgroundColor = [UIColor clearColor];
        numLabel.textColor = [UIColor blackColor];
        if(i%10==0)
        {
            [numLabel setFont:[UIFont boldSystemFontOfSize:12]];
            numLabel.text = [NSString stringWithFormat:@"—%d",i/10];
        }else
        {
        [numLabel setFont:[UIFont systemFontOfSize:5]];
        numLabel.text = [NSString stringWithFormat:@"—%d",i];
        }
        [self.view addSubview:numLabel];
        index++;
    }
    index = 1;
    for(int i=rulerStart;i<=currentPoint;i++)
    {
        UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenSize.width-98,(-5+(index-1)*6.5),100,20)];
        numLabel.backgroundColor = [UIColor clearColor];
        numLabel.textColor = [UIColor blackColor];
        numLabel.textAlignment = NSTextAlignmentRight;
        if(i%10==0)
        {
            [numLabel setFont:[UIFont boldSystemFontOfSize:12]];
            numLabel.text = [NSString stringWithFormat:@"%d—",i/10];
        }else
        {
            [numLabel setFont:[UIFont systemFontOfSize:5]];
            numLabel.text = [NSString stringWithFormat:@"%d—",i];
        }
        [self.view addSubview:numLabel];
        index++;
    }
    
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.updateInterval = .1;
    self.accelerometer.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

/*private float[] exponentialSmoothing( float[] input, float[] output, float alpha ) {
    if ( output == null )
        return input;
    for ( int i=0; i<input.length; i++ ) {
        output[i] = output[i] + alpha * (input[i] - output[i]);
    }
    return output;
}*/

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    
    // High Pass Filter:::
    /*rollingY = (acceleration.y * kFilteringFactor) + (rollingY * (1.0 - kFilteringFactor));
     float accelY = acceleration.y - rollingY;
    NSLog(@"%f %f",rollingY,accelY);*/
    
    
    /* Low Pass Filter:::: */
    rollingY = acceleration.y*kFilteringFactor + rollingY*(1-kFilteringFactor);
    NSLog(@"%f",rollingY);
    
    
}

-(IBAction) increaseRuler:(id) sender
{
    [savedInfo increaseCurrentPoint];
    ViewController *second =[[ViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:second animated:YES completion:^{ }];
}

-(IBAction) decreaseRuler:(id) sender
{
    [savedInfo decreaseCurrentPoint];
    ViewController *second =[[ViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:second animated:YES completion:^{ }];
}

-(IBAction) resetRuler:(id) sender
{
    [savedInfo resetCurrentPoint];
    ViewController *second =[[ViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:second animated:NO completion:^{ }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
