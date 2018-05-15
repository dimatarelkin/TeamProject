//
//  UIFirstNavigationController.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 15/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "UIFirstNavigationController.h"
#import "UISecondNavigationController.h"

@interface UIFirstNavigationController ()

@end

@implementation UIFirstNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"NAV1 | viewDidLoad");
    //title and background
    self.title = @"Menu";
    self.view.backgroundColor = [UIColor grayColor];
    
    //name of our team
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 100, 300, 50)]; //подумайте как сделать ровно для всех айфонов
    [label setText:@"OUR AWESOME TEAM"];
    [label setFont:[UIFont fontWithName:@"Helvetica" size:15]];
    [self.view addSubview: label];
    
    [label release];
    
    //add subView
    
    
    //bar button
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Start"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(barButtonItemClick:)];
    [self.navigationItem setRightBarButtonItem:rightButton];
    [rightButton release];
}

- (void)barButtonItemClick:(id)sender {
    UISecondNavigationController *svc = [[UISecondNavigationController alloc] init];
    [self.navigationController pushViewController:svc animated:true];
    
    [svc release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: - Step 2
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"NAV1 | viewWillAppear");
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"NAV1 | viewWillLayoutSubviews");
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"NAV1 | viewDidLayoutSubviews");
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"NAV1 | viewDidAppear");
}
// MARK: - Step 3
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"NAV1 | viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"NAV1 | viewDidDisappear");
}
- (void)dealloc {
    NSLog(@"NAV1 | dealloc");
    [super dealloc];
}


@end
