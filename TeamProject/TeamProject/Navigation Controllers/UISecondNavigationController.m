//
//  UISecondNavigationController.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 15/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "UISecondNavigationController.h"
#import "UIThirdNavigationController.h"
#import "Game.h"
#import "Gun.h"
#import "Human.h"

@interface UISecondNavigationController ()

@end

@implementation UISecondNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"NAV2 | viewDidLoad");
    //title and background
    self.title = @"Game";
    self.view.backgroundColor = [UIColor yellowColor];
    
    //bar button with timer
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Results"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(barButtonItemClick:)];
    [self.navigationItem setRightBarButtonItem:rightButton];
    
    
    
    //start game
    Game* game = [[Game alloc] init];
    [game startGame];
    
    //adding gun
    Gun* gun = [[Gun alloc] initWithFrame:CGRectMake(40, 600, 100, 100)];
    gun.backgroundColor = [UIColor blackColor];
    [self.view addSubview:gun];
    
    //adding human
    Human* human = [[Human alloc] initWithFrame:CGRectMake(300, 100, 100, 100)];
    human.backgroundColor = [UIColor redColor];
    [self.view addSubview:human];
    
   
}

- (void)barButtonItemClick:(id)sender {
    UIThirdNavigationController *tvc = [[UIThirdNavigationController alloc] init];
    [self.navigationController pushViewController:tvc animated:true];
    
    [tvc release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: - Step 2
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"NAV2 | viewWillAppear");
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
//    NSLog(@"NAV2 | viewWillLayoutSubviews");
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    NSLog(@"NAV2 | viewDidLayoutSubviews");
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSLog(@"NAV2 | viewDidAppear");
}
// MARK: - Step 3
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    NSLog(@"NAV2 | viewWillDisappear");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    NSLog(@"NAV2 | viewDidDisappear");
}
- (void)dealloc {
    NSLog(@"NAV2 | dealloc");
    [super dealloc];
}

@end
