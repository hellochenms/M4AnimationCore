//
//  ProgressLayer_CA_Explicit_OC.m
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/5.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import "ProgressLayer_CA_Explicit_OC.h"

@implementation ProgressLayer_CA_Explicit_OC
@dynamic progress;

#pragma mark - Override
+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor].CGColor;
    }
    
    return self;
}

- (void)drawInContext:(CGContextRef)ctx {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat midY = CGRectGetMidY(self.bounds);
    CGFloat fromX = 10;
    [path moveToPoint:CGPointMake(10, midY)];
    CGFloat toX = CGRectGetWidth(self.bounds) - 10;
    CGFloat actualToX = fromX + (toX - fromX) * self.progress;
    [path addLineToPoint:CGPointMake(actualToX, midY)];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextStrokePath(ctx);
}

@end
