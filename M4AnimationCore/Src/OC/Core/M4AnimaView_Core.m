//
//  M4AnimaView_Core.m
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/5.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import "M4AnimaView_Core.h"
#import "ProgressLayer_CA_Explicit_OC.h"
#import "M4Animation.h"

@interface M4AnimaView_Core()
@property (nonatomic) ProgressLayer_CA_Explicit_OC *subLayer;
@end

@implementation M4AnimaView_Core
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
    [self.subLayer m4a_removeAllAnimations];
    self.subLayer.progress = 0;
    
    M4Animation *anima = [M4Animation animationWithKeyPath:@"progress"];
    anima.duration = 2;
    anima.fromValue = @0;
    anima.toValue = @1;
    [self.subLayer m4a_addAnimation:anima];
}

- (void)reset {
    [self.subLayer m4a_removeAllAnimations];
    
    self.subLayer.progress = 0;
}

@end
