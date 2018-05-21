//
//  UIThirdNavigationController.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 15/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "UIThirdNavigationController.h"
#import "UIFirstNavigationController.h"

@interface UIThirdNavigationController ()

@end

@implementation UIThirdNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"NAV3 | viewDidLoad");
    
    //title and background
    self.title = @"RESULTS";
    self.view.backgroundColor = [UIColor whiteColor];

    //bar button with timer
    UIButton *backToMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backToMenuButton.layer.cornerRadius = 15;
    backToMenuButton.clipsToBounds = NO;
    [backToMenuButton.layer setBackgroundColor:[UIColor clearColor].CGColor];
    
    [backToMenuButton setTitle:@"Menu" forState:UIControlStateNormal];
    [[backToMenuButton titleLabel] setFont:[UIFont fontWithName:@"AvenirNext-Heavy" size:20]];
    [backToMenuButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backToMenuButton setTitleColor:[[UIColor purpleColor] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [backToMenuButton addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backToMenuBarButton = [[UIBarButtonItem alloc] initWithCustomView:backToMenuButton];
    [self.navigationItem setRightBarButtonItem:backToMenuBarButton];
    
    //hide left bar button item
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;
    
    //releasing objects
    [backToMenuButton release];
}

- (void)barButtonItemClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
- (void)dealloc {
//    NSLog(@"NAV3 | dealloc");
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
