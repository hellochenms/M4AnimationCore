//
//  M4Animator.m
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/5.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import "M4Animator.h"
#import <QuartzCore/QuartzCore.h>

@interface M4Animator()
@property (nonatomic) CADisplayLink *displayLink;
@property (nonatomic) NSMutableDictionary *objectAnimationMapping;
@property (nonatomic) NSMutableArray *animations;
@end

@implementation M4Animator
#pragma mark -
+ (instancetype)sharedInstance {
    static M4Animator *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.animations = [NSMutableArray array];
        self.objectAnimationMapping = [NSMutableDictionary dictionary];
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onFire)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    
    return self;
}

#pragma mark -
- (void)addAnimation:(M4Animation *)animation {
    NSString *key = [NSString stringWithFormat:@"%ld", [animation.object hash]];
    NSMutableDictionary *animationDict = [self.objectAnimationMapping objectForKey:key];
    if (!animationDict) {
        animationDict = [NSMutableDictionary dictionary];
        [self.objectAnimationMapping setObject:animationDict forKey:key];
    }
    if ([animationDict objectForKey:animation.keyPath]) {
        return;
    }
    animation.beginTime = CFAbsoluteTimeGetCurrent();
    [animationDict setObject:animation forKey:animation.keyPath];
}

#pragma mark -
- (void)onFire {
    [[self.objectAnimationMapping allKeys] enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *doneKeys = [NSMutableArray array];
        NSMutableDictionary *animationDict = [self.objectAnimationMapping objectForKey:key];
        [[animationDict allKeys] enumerateObjectsUsingBlock:^(NSString *  _Nonnull keyPath, NSUInteger idx, BOOL * _Nonnull stop) {
            M4Animation *animation = [animationDict objectForKey:keyPath];
            
            CFTimeInterval curTime = CFAbsoluteTimeGetCurrent();
            CFTimeInterval passedTime = curTime - animation.beginTime;
            BOOL shouldEnd = NO;
            if (passedTime > animation.duration) {
                passedTime = animation.duration;
                shouldEnd = YES;
            }
            if (shouldEnd) {
                NSLog(@"【chenms】end-animation.keyPath:%@  %s", animation.keyPath, __func__);
                [doneKeys addObject:animation.keyPath];
            }
            
            CGFloat progress = passedTime / animation.duration;
            id current = [animation currentValueWithProgress:progress];
            [animation.object setValue:current forKey:animation.keyPath];
        }];
        
        [doneKeys enumerateObjectsUsingBlock:^(NSString *  _Nonnull keyPath, NSUInteger idx, BOOL * _Nonnull stop) {
            [animationDict removeObjectForKey:keyPath];
        }];
    }];
}

- (void)removeAllAnimationWithObject:(NSObject *)object {
    NSString *key = [NSString stringWithFormat:@"%ld", [object hash]];
    [self.objectAnimationMapping removeObjectForKey:key];
}

@end
