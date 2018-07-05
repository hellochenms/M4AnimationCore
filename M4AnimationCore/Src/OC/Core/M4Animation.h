//
//  M4Animation.h
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/5.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, M4ValueType) {
    M4ValueTypeCGFloat,
};

@interface M4Animation : NSObject
@property (nonatomic, copy) NSString *keyPath;
@property (nonatomic) M4ValueType valueType;
@property CFTimeInterval duration;
@property (nonatomic) id fromValue;
@property (nonatomic) id toValue;
@property (nonatomic, weak) NSObject *object;
@property (nonatomic) CFTimeInterval beginTime;
@property (nonatomic) BOOL hasDone;
+ (M4Animation *)animationWithKeyPath:(NSString *)keyPath;
- (id)currentValueWithProgress:(CGFloat)progress;
@end

@interface CALayer(M4Animation)
- (void)m4a_addAnimation:(M4Animation *)anim;
- (void)m4a_removeAllAnimations;
@end
