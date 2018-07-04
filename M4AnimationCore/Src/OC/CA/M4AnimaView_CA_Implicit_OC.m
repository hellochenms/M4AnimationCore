//
//  M4AnimaView_CA_Implicit_OC.m
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/1.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import "M4AnimaView_CA_Implicit_OC.h"

@interface M4AnimaView_CA_Implicit_OC()
@property (nonatomic) ProgressLayer_CA_Implicit_OC *subLayer;
@end

@implementation M4AnimaView_CA_Implicit_OC

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.subLayer = [ProgressLayer_CA_Implicit_OC layer];
        [self.layer addSublayer:self.subLayer];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.subLayer.frame = self.bounds;
}

- (void)start {
    [self.subLayer removeAllAnimations];
    
    self.subLayer.progress = 1;
}

- (void)reset {
    [self.subLayer removeAllAnimations];
    
    self.subLayer.progress = 0;
}

@end

@implementation ProgressLayer_CA_Implicit_OC
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

- (id<CAAction>)actionForKey:(NSString *)event {
    if ([event isEqualToString:@"progress"]) {
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"progress"];
        anima.duration = 2;
        anima.fromValue = @([self presentationLayer].progress);

        return anima;
    } else {
        return [super actionForKey:event];
    }
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
