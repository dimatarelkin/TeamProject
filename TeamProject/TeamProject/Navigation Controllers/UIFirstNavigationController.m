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
    NSLog(@"NAVC 1 viewDidLoad");
    
    //title and background
    self.title = @"Main";
    self.navigationController.navigationBar.titleTextAttributes =
    @{NSForegroundColorAttributeName: [UIColor blackColor],
                 NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Heavy" size:20]};
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    
    //add constraints
    CGRect navigationBarFrame = [[self.navigationController navigationBar] frame];
    CGFloat minX = CGRectGetMinX(navigationBarFrame);
    CGFloat minY = CGRectGetMaxY(navigationBarFrame);
    CGFloat maxX = CGRectGetMaxX(self.view.frame);
    CGFloat maxY = CGRectGetMaxY(self.view.frame);
    CGFloat firstY = minY * 2;
    CGFloat secondY = firstY + maxX;
    
    //create rects
    CGRect rectForGameName = CGRectMake(minX, minY, maxX, minY);
    CGRect rectForLogoLayer = CGRectMake(minX, firstY, maxX, maxX);
    CGRect rectForCreatorsInfo = CGRectMake(minX, secondY, maxX, maxY - secondY);
    
    //name of our team
    UILabel *teamLabel = [[UILabel alloc] initWithFrame:rectForGameName];
    [teamLabel setText:@"First Team"];
    teamLabel.layer.backgroundColor = [UIColor clearColor].CGColor;
    teamLabel.textColor = [UIColor blackColor];
    teamLabel.textAlignment = NSTextAlignmentCenter;
    [teamLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:50]];
    [self.view addSubview: teamLabel];
    
    //add logo layer on view
    CALayer* logoLayer = [[CALayer alloc] init];
    logoLayer.frame = rectForLogoLayer;
    CGFloat offset = CGRectGetMaxY(self.view.frame)/6;
    logoLayer.bounds = CGRectMake(rectForLogoLayer.origin.x + offset, rectForLogoLayer.origin.y + offset,
                                  rectForLogoLayer.size.width - offset, rectForLogoLayer.size.height - offset);
    logoLayer.backgroundColor = [UIColor clearColor].CGColor;
    [logoLayer setContents:(id)[UIImage imageNamed:@"Airborne"].CGImage];
    logoLayer.contentsGravity = kCAGravityResizeAspect;
    [self.view.layer addSublayer:logoLayer];
    
    //add creators info
    UITextView *info = [[UITextView alloc] initWithFrame:rectForCreatorsInfo];
    [info setText:@"Creators: \nDmitriy Tarelkin\nRodion Ygrinovich\nRoman Krutev\nNataliya Muravieva"];
    info.textAlignment = NSTextAlignmentCenter;
    [info setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [self.view addSubview:info];
    
    //releasing objects
    [logoLayer release];
    [teamLabel release];
    [info release];
   
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
