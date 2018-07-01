//
//  OCViewController.m
//  M4AnimationCore
//
//  Created by Chen,Meisong on 2018/6/30.
//  Copyright © 2018年 xyz.chenms. All rights reserved.
//

#import "OCViewController.h"
#import "M4AnimaView_CA_Explicit_OC.h"
#import "M4AnimaView_CA_Implicit_OC.h"

@interface OCViewController ()
@property (nonatomic) M4AnimaView_CA_Explicit_OC *caView;
@property (nonatomic) M4AnimaView_CA_Implicit_OC *caImplicitView;
@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // CA Explicit
    self.caView = [[M4AnimaView_CA_Explicit_OC alloc] initWithFrame:CGRectMake(20, 84, 200, 60)];
    [self.view addSubview:self.caView];
    
    UIButton *caStart = [UIButton buttonWithType:UIButtonTypeSystem];
    caStart.frame = CGRectMake(CGRectGetMinX(self.caView.frame), CGRectGetMaxY(self.caView.frame) + 10, 80, 40);
    [caStart setTitle:@"CA-Start" forState:UIControlStateNormal];
    [caStart addTarget:self action:@selector(onTapCAStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:caStart];
    
    UIButton *caReset = [UIButton buttonWithType:UIButtonTypeSystem];
    caReset.frame = CGRectMake(CGRectGetMaxX(caStart.frame) + 20, CGRectGetMaxY(self.caView.frame) + 10, 80, 40);
    [caReset setTitle:@"CA-Reset" forState:UIControlStateNormal];
    [caReset addTarget:self action:@selector(onTapCAReset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:caReset];
    
    // CA Implicit
    self.caImplicitView = [[M4AnimaView_CA_Implicit_OC alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(caStart.frame) + 20, 200, 60)];
    [self.view addSubview:self.caImplicitView];
    
    UIButton *caImplicitStart = [UIButton buttonWithType:UIButtonTypeSystem];
    caImplicitStart.frame = CGRectMake(CGRectGetMinX(self.caImplicitView.frame), CGRectGetMaxY(self.caImplicitView.frame) + 10, 120, 40);
    [caImplicitStart setTitle:@"CA-Start-Implicit" forState:UIControlStateNormal];
    [caImplicitStart addTarget:self action:@selector(onTapCAStartImplicit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:caImplicitStart];
    
    UIButton *caImplicitReset = [UIButton buttonWithType:UIButtonTypeSystem];
    caImplicitReset.frame = CGRectMake(CGRectGetMaxX(caImplicitStart.frame) + 20, CGRectGetMaxY(self.caImplicitView.frame) + 10, 120, 40);
    [caImplicitReset setTitle:@"CA-Reset-Implicit" forState:UIControlStateNormal];
    [caImplicitReset addTarget:self action:@selector(onTapCAResetImplicit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:caImplicitReset];
    
}

#pragma mark - Event
- (void)onTapCAStart {
    [self.caView start];
}

- (void)onTapCAReset {
    [self.caView reset];
}

- (void)onTapCAStartImplicit {
    [self.caImplicitView start];
}

- (void)onTapCAResetImplicit {
    [self.caImplicitView reset];
}

@end
