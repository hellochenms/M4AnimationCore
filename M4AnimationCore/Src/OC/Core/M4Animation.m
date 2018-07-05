//
//  M4Animation.m
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/5.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import "M4Animation.h"
#import "M4Animator.h"

@implementation M4Animation
+ (M4Animation *)animationWithKeyPath:(NSString *)keyPath {
    M4Animation *animation = [M4Animation new];
    animation.keyPath = keyPath;
    
    return animation;
}

- (id)currentValueWithProgress:(CGFloat)progress {
    id current = nil;
    switch (self.valueType) {
        case M4ValueTypeCGFloat: {
            CGFloat from = [self.fromValue doubleValue];
            CGFloat to = [self.toValue doubleValue];
            current = @(from + (to - from) * progress);
            break;
        }
        default:
            break;
    }
    
    return current;
}
@end


@implementation CALayer(M4Animation)
- (void)m4a_addAnimation:(M4Animation *)anim {
    anim.object = self;
    [[M4Animator sharedInstance] addAnimation:anim];
}

- (void)m4a_removeAllAnimations {
    [[M4Animator sharedInstance] removeAllAnimationWithObject:self];
}

@end


