//
//  savedInfo.h
//  Easy Measure
//
//  Created by asaf halili on 22/04/13.
//  Copyright (c) 2013 asaf halili. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface savedInfo : NSObject


+(BOOL) isCM;
+(int) currentPoint;
+(int) rulerHeight;
+(void) increaseCurrentPoint;
+(void) decreaseCurrentPoint;
+(void) resetCurrentPoint;

@end
