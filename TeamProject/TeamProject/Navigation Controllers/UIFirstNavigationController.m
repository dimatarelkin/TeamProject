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
    
    //title and background
    self.title = @"AIRBORNE";
    self.navigationController.navigationBar.titleTextAttributes =
    @{NSForegroundColorAttributeName: [UIColor blackColor],
                 NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Heavy" size:20]};
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    
    //name of our team
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 100, 300, 50)];
    [label setText:@"OUR AWESOME TEAM"];
    [label setFont:[UIFont fontWithName:@"AvenirNext-Heavy" size:20]];
    [self.view addSubview: label];
    
    //releasing objects
    
    [label release];
   
}




#pragma mark Start Game
- (void)barButtonItemClick:(id)sender {
    UISecondNavigationController *svc = [[UISecondNavigationController alloc] init];
    [self.navigationController pushViewController:svc animated:true];
    [svc release];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    //bar button customization
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.layer.cornerRadius = 15;
    rightButton.clipsToBounds = NO;
    rightButton.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    [rightButton setTitle:@"Start" forState:UIControlStateNormal];
    [[rightButton titleLabel] setFont:[UIFont fontWithName:@"AvenirNext-Heavy" size:20]];
    [rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[[UIColor purpleColor] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *myButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    [self.navigationItem setRightBarButtonItem:myButton];
    
    //releasing objects
    [rightButton release];

}

#pragma mark - Appearing methods

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Disappear methods

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    NSLog(@"NAV1 | dealloc");
    [super dealloc];
}


@end
