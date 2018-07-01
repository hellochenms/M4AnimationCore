//
//  M4AnimaView_CA_Implicit_OC.h
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/7/1.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProgressLayer_CA_Implicit_OC;

@interface M4AnimaView_CA_Implicit_OC : UIView
- (void)start;
- (void)reset;
@end

@interface ProgressLayer_CA_Implicit_OC: CALayer
@property (nonatomic) CGFloat progress;
@end
