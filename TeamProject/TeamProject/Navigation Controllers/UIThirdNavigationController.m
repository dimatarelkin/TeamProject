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
    self.view.backgroundColor = [UIColor whiteColor];

    //bar button
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
    
    //add constraints
    CGRect navigationBarFrame = [[self.navigationController navigationBar] frame];
    CGFloat minX = CGRectGetMinX(navigationBarFrame);
    CGFloat minY = CGRectGetMaxY(navigationBarFrame);
    CGFloat maxX = CGRectGetMaxX(self.view.frame);
    CGFloat maxY = CGRectGetMaxY(self.view.frame);
    CGFloat firstY = minY * 2;
    CGFloat secondY = firstY + maxX;
    
    //create rects
    CGRect rectForResualtLabel = CGRectMake(minX, minY, maxX, firstY);
    CGRect rectForScoreNumber = CGRectMake(minX, firstY, maxX, maxX);
    CGRect rectForPlainsDrawing = CGRectMake(minX, secondY, maxX, maxY - secondY);
    
    //result Label
    UILabel *resultLabel = [[UILabel alloc] initWithFrame:rectForResualtLabel];
    [resultLabel setText:@"Score:"];
    resultLabel.layer.backgroundColor = [UIColor clearColor].CGColor;
    resultLabel.textColor = [UIColor blackColor];
    resultLabel.textAlignment = NSTextAlignmentCenter;
    [resultLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:100]];
    [self.view addSubview: resultLabel];
    
    //score number label
    int score = _score;
    UILabel *scoreNumberLabel = [[UILabel alloc] initWithFrame:rectForScoreNumber];
    NSString* scoreNum = [NSString stringWithFormat:@"%i",score];
    [scoreNumberLabel setText:scoreNum];
    scoreNumberLabel.layer.backgroundColor = [UIColor clearColor].CGColor;
    scoreNumberLabel.textColor = [UIColor redColor];
    scoreNumberLabel.textAlignment = NSTextAlignmentCenter;
    [scoreNumberLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:250]];
    [self.view addSubview: scoreNumberLabel];
    
    //plain layer
    CALayer* plainLayer = [[CALayer alloc] init];
    plainLayer.frame = rectForPlainsDrawing;
    CGFloat offset = CGRectGetMaxY(self.view.frame)/20;
    plainLayer.bounds = CGRectMake(rectForPlainsDrawing.origin.x , rectForPlainsDrawing.origin.y ,
                                  rectForPlainsDrawing.size.width, rectForPlainsDrawing.size.height - offset);
    plainLayer.backgroundColor = [UIColor clearColor].CGColor;
    [plainLayer setContents:(id)[UIImage imageNamed:@"jet"].CGImage];
    plainLayer.contentsGravity = kCAGravityResizeAspect;
    [self.view.layer addSublayer:plainLayer];
    
    //hide left bar button item
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.hidesBackButton = YES;

    
    //releasing objects
    [backToMenuButton release];
    [resultLabel release];
    [scoreNumberLabel release];
    [scoreNum release];
    [plainLayer release];
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
