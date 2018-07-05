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
#import "M4AnimaView_DL_OC.h"
#import "M4AnimaView_Core.h"

@interface OCViewController ()
@property (nonatomic) M4AnimaView_CA_Explicit_OC *caView;
@property (nonatomic) M4AnimaView_CA_Implicit_OC *caImplicitView;
@property (nonatomic) M4AnimaView_DL_OC *dlView;
@property (nonatomic) M4AnimaView_Core *coreView;
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
    
    // DisplayLink
    self.dlView = [[M4AnimaView_DL_OC alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(caImplicitStart.frame) + 20, 200, 60)];
    [self.view addSubview:self.dlView];
    
    UIButton *dlStart = [UIButton buttonWithType:UIButtonTypeSystem];
    dlStart.frame = CGRectMake(CGRectGetMinX(self.dlView.frame), CGRectGetMaxY(self.dlView.frame) + 10, 100, 40);
    [dlStart setTitle:@"DL-Start" forState:UIControlStateNormal];
    [dlStart addTarget:self action:@selector(onTapDLStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dlStart];
    
    UIButton *dlReset = [UIButton buttonWithType:UIButtonTypeSystem];
    dlReset.frame = CGRectMake(CGRectGetMaxX(dlStart.frame) + 20, CGRectGetMaxY(self.dlView.frame) + 10, 100, 40);
    [dlReset setTitle:@"DL-Reset" forState:UIControlStateNormal];
    [dlReset addTarget:self action:@selector(onTapDLReset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dlReset];
    
    UIButton *dlClean = [UIButton buttonWithType:UIButtonTypeSystem];
    dlClean.frame = CGRectMake(CGRectGetMaxX(dlReset.frame) + 20, CGRectGetMaxY(self.dlView.frame) + 10, 100, 40);
    [dlClean setTitle:@"DL-Clean" forState:UIControlStateNormal];
    [dlClean addTarget:self action:@selector(onTapDLClean) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dlClean];
    
    // Custom Core
    self.coreView = [[M4AnimaView_Core alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(dlStart.frame) + 20, 200, 60)];
    [self.view addSubview:self.coreView];
    
    UIButton *coreStart = [UIButton buttonWithType:UIButtonTypeSystem];
    coreStart.frame = CGRectMake(CGRectGetMinX(self.coreView.frame), CGRectGetMaxY(self.coreView.frame) + 10, 100, 40);
    [coreStart setTitle:@"Core-Start" forState:UIControlStateNormal];
    [coreStart addTarget:self action:@selector(onTapCoreStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:coreStart];
    
    UIButton *coreReset = [UIButton buttonWithType:UIButtonTypeSystem];
    coreReset.frame = CGRectMake(CGRectGetMaxX(coreStart.frame) + 20, CGRectGetMaxY(self.coreView.frame) + 10, 100, 40);
    [coreReset setTitle:@"Core-Reset" forState:UIControlStateNormal];
    [coreReset addTarget:self action:@selector(onTapCoreReset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:coreReset];
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

- (void)onTapDLStart {
    [self.dlView start];
}

- (void)onTapDLReset {
    [self.dlView reset];
}

- (void)onTapDLClean {
    [self.dlView clean];
}

- (void)onTapCoreStart {
    [self.coreView start];
}

- (void)onTapCoreReset {
    [self.coreView reset];
}


@end
