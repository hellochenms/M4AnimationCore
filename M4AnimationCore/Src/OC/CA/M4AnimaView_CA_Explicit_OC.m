//
//  M4AnimaView_CA_OC.m
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/6/30.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import "M4AnimaView_CA_Explicit_OC.h"
#import "ProgressLayer_CA_Explicit_OC.h"

@interface M4AnimaView_CA_Explicit_OC()
@property (nonatomic) ProgressLayer_CA_Explicit_OC *subLayer;
@end

@implementation M4AnimaView_CA_Explicit_OC

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.subLayer = [ProgressLayer_CA_Explicit_OC layer];
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
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"progress"];
    anima.duration = 2;
    anima.fromValue = @0;
    anima.toValue = @1;
    [self.subLayer addAnimation:anima forKey:nil];
    
    self.subLayer.progress = 1;
}

- (void)reset {
    [self.subLayer removeAllAnimations];
    
    self.subLayer.progress = 0;
}

@end


