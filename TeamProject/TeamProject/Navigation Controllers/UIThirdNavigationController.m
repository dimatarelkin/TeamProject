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
    NSLog(@"NAV3 | dealloc");
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
