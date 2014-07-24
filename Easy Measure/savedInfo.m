//
//  savedInfo.m
//  Easy Measure
//
//  Created by asaf halili on 22/04/13.
//  Copyright (c) 2013 asaf halili. All rights reserved.
//

#import "savedInfo.h"

@implementation savedInfo

static bool isCM =YES;
static int currentPoint;
static int rulerHeight;

+(BOOL) isCM
{
    if(!isCM)
        isCM = YES;
    return isCM;
}

+(int) currentPoint
{
    if(!currentPoint || currentPoint == 0)
    {
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        if(screenSize.height > 480.0f)
        {
            currentPoint = 87;
        }
        else
        {
            currentPoint = 75;
        }
    }
    return currentPoint;
}

+(void) resetCurrentPoint
{
    currentPoint = 0;
}

+(int) rulerHeight
{
    if(!rulerHeight)
    {
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        if(screenSize.height > 480.0f)
        {
            rulerHeight = 87;
        }
        else
        {
            rulerHeight = 75;
        }
    }
    return rulerHeight;
}

+(void) increaseCurrentPoint
{
    currentPoint += [self rulerHeight];
}

+(void) decreaseCurrentPoint
{
    currentPoint -= [self rulerHeight];
}

@end
