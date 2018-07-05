//
//  M4Animator.h
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/5.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "M4Animation.h"

@interface M4Animator : NSObject
+ (instancetype)sharedInstance;
- (void)addAnimation:(M4Animation *)animation;
- (void)removeAllAnimationWithObject:(NSObject *)object;
@end
