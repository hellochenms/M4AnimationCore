//
//  M4AnimaView_DL_OC.m
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/4.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import "M4AnimaView_DL_OC.h"

@interface M4AnimaView_DL_OC()
@property (nonatomic) CADisplayLink *displayLink;
@property (nonatomic) CFTimeInterval beginTime;
@property (nonatomic) CGFloat progress;
@end

static CFTimeInterval kDuration = 2;

@implementation M4AnimaView_DL_OC

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onFire)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        self.displayLink.paused = YES;
    }
    
    return self;
}

- (void)start {
    self.progress = 0;
    self.beginTime = CFAbsoluteTimeGetCurrent();
    self.displayLink.paused = NO;
}

- (void)reset {
    self.displayLink.paused = YES;
    self.beginTime = 0;
    self.progress = 0;
    [self refreshSelf:self.progress];
}

#pragma mark - 本demo只是为了展示概念，不处理CADisplayLink和本类的循环引用
- (void)clean {
    [self.displayLink invalidate];
}

#pragma mark - Timer
- (void)onFire {
    CFTimeInterval curTime = CFAbsoluteTimeGetCurrent();
    CFTimeInterval passedTime = curTime - self.beginTime;
    BOOL shouldEnd = NO;
    if (passedTime > kDuration) {
        passedTime = kDuration;
        shouldEnd = YES;
    }
    self.progress = passedTime / kDuration;
    [self refreshSelf:self.progress];
    
    if (shouldEnd) {
        self.displayLink.paused = YES;
    }
}

- (void)refreshSelf:(CGFloat)progress {
    UIImage *image = [self imageForFrame:progress];
    self.layer.contents = (id)image.CGImage;
}

- (UIImage *)imageForFrame:(CGFloat)progress {
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat midY = CGRectGetMidY(self.bounds);
    CGFloat fromX = 10;
    [path moveToPoint:CGPointMake(10, midY)];
    CGFloat toX = CGRectGetWidth(self.bounds) - 10;
    CGFloat actualToX = fromX + (toX - fromX) * progress;
    [path addLineToPoint:CGPointMake(actualToX, midY)];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextStrokePath(ctx);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - Life Cycle
- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
