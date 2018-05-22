//
//  UISecondNavigationController.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 15/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "UISecondNavigationController.h"
#import "UIThirdNavigationController.h"
#import "Gun.h"
#import "Human.h"


@interface UISecondNavigationController () {
    int seconds;
    NSTimer *timer;
}

@end



@implementation UISecondNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"NAV2 | viewDidLoad");
    
    //title and background
    self.title = @"SHOOT!";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //bar button customization
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.layer.cornerRadius = 15;
    backButton.clipsToBounds = NO;
    [backButton.layer setBackgroundColor:[UIColor clearColor].CGColor];
    
    [backButton setTitle:@"Menu" forState:UIControlStateNormal];
    [[backButton titleLabel] setFont:[UIFont fontWithName:@"AvenirNext-Heavy" size:20]];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[[UIColor purpleColor] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(barButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:leftButton];

    //coordinats
    CGRect navigationBarFrame = [[self.navigationController navigationBar] frame];
    CGFloat minX = CGRectGetMinX(navigationBarFrame);
    CGFloat minY = CGRectGetMaxY(navigationBarFrame);
    CGFloat maxX = CGRectGetMaxX(self.view.frame);
    CGFloat maxY = CGRectGetMaxY(self.view.frame);
    CGFloat firstY = (maxY - minY) / 12 + minY;

    //rects
    CGRect rectForTimer = CGRectMake(minX, minY, maxX, firstY - minY);
    CGRect rectForGame = CGRectMake(minX, firstY, maxX, maxY - firstY);

    //adding human and gun
    [self addGunAndHumanInRect:rectForGame];
    
    //timer label
    [self startTimerInRect:rectForTimer];
    
    //releasing objects
    [backButton release];
    
    [self.humanView startHumanAnimation];
}

- (void)barButtonItemClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    [timer invalidate];
    if([self.humanView.timerCheck isValid]) {
        [[self.humanView timerCheck] invalidate];
    }
}

- (void)startTimerInRect:(CGRect)rect {
    //отрисовка таймера из viewDidLoad
    self.timerLabel = [[UILabel alloc] initWithFrame:rect];
    [self.timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
    [self.timerLabel setFont:[UIFont fontWithName:@"AvenirNext-Heavy" size:40]];
    self.timerLabel.backgroundColor = [UIColor clearColor];
    self.timerLabel.textColor = [UIColor blackColor];
    [self.timerLabel setTextAlignment:NSTextAlignmentCenter];
    [self.timerLabel setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:self.timerLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //запуск таймера
    seconds = 10;
    [self.timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(timerEnds)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)timerEnds {
    //timer ends and game ends also
    if (seconds == 0) {
        [timer invalidate];
        NSLog(@"Timer invalidated");
        UIThirdNavigationController *tvc = [[UIThirdNavigationController alloc] init];
        [self.navigationController pushViewController:tvc animated:true];
        [timer invalidate];
        
        [self.humanView setStopTimerBySeconds:YES];
        
        if([self.humanView.timerCheck isValid]) {
            [[self.humanView timerCheck] invalidate];
        }
        [tvc setScore:self.humanView.counterKill];
        //release objects
        [tvc release];

    } else {
        seconds -=1;
        self.timerLabel.text = [NSString stringWithFormat:@"Time: %d", seconds];
    }
}

- (void)addGunAndHumanInRect:(CGRect)rect {

    CGFloat newHeight = rect.size.height /5;
    CGFloat newWidth  = rect.size.width /5;
    CGFloat originX = CGRectGetMidX(rect) - newWidth /2;
    CGFloat originY = CGRectGetMaxY(rect) - newHeight;
    NSLog(@"%f,%f,%f,%f", newHeight, newWidth,originX,originY);
    
    // Gun init
    self.gunView = [[Gun alloc] initWithFrame:CGRectMake(originX, originY, newWidth, newHeight)];
    self.gunView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.gunView];
    [self.gunView  autorelease];
    
    //Shot init
    self.shotView = [[Shot alloc] initWithFrame:CGRectMake(originX + newWidth / 2, originY, 12, 12)];
    [self.shotView setFirstState:CGPointMake(originX + newWidth / 2, originY)];
    [self.shotView setBackgroundColor:[UIColor clearColor]];
    [self.shotView setAlpha:0];
    [self.view addSubview:self.shotView];
    [self.shotView release];
    
    //Human init
    CGFloat randomY = 150 + arc4random_uniform(100);
    self.humanView = [[Human alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.frame) * 1.1, randomY, 85, 40)];
    self.humanView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_humanView];
    [self.humanView autorelease];
    [self.humanView setShot:_shotView];
    [self.humanView setStopTimerBySeconds:NO];
}



/* ===========================================Touches Handling methods=================================================*/

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    CGPoint myTouchPoint = [myTouch locationInView:myTouch.view];

    //СТАРТУЕМ И УКАЗЫВАЕМ КОНЕЧНУЮ ТОЧКУ ПОЛЁТА
    [self.shotView startAnimationShot:myTouchPoint];
    NSLog(@"%@", NSStringFromCGPoint(self.humanView.layer.presentationLayer.position));
}


/*
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

- (void)dealloc {
    NSLog(@"NAV2 | dealloc");
    [super dealloc];
    
}
@end
