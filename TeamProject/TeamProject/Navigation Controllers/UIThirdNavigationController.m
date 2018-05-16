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
    self.title = @"Results";
    self.view.backgroundColor = [UIColor blueColor];
    
    
    //add subView
    
    
    //bar button with timer
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(barButtonItemClick:)];
    [self.navigationItem setRightBarButtonItem:rightButton];
}

- (void)barButtonItemClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: - Step 2
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"NAV3 | viewWillAppear");
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
//    NSLog(@"NAV3 | viewWillLayoutSubviews");
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    NSLog(@"NAV3 | viewDidLayoutSubviews");
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSLog(@"NAV3 | viewDidAppear");
}
// MARK: - Step 3
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    NSLog(@"NAV3 | viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    NSLog(@"NAV3 | viewDidDisappear");
}
- (void)dealloc {
    NSLog(@"NAV3 | dealloc");
    [super dealloc];
}

@end
