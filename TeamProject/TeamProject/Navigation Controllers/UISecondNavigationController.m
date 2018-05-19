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

@interface UISecondNavigationController () {
    int seconds;
    NSTimer* timer;
}
@property (weak, nonatomic) UILabel* timerLabel;
@property (weak, nonatomic) Gun* gunView;
@property (weak, nonatomic) Human* humanView;

- (void)addHumanInRect:(CGRect)rect;
- (void)addGunInRect:(CGRect)rect;
- (void)startTimerInRect:(CGRect)rect;

@end



@implementation UISecondNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"NAV2 | viewDidLoad");
    //title and background
    self.title = @"Game";
    self.view.backgroundColor = [UIColor orangeColor];
    
    //bar button with timer
   
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Exit"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(barButtonItemClick:)];
    [self.navigationItem setLeftBarButtonItem:leftButton];

   
    //prepare rects for view
    //coordinats
    CGRect navigationBarFrame = [[self.navigationController navigationBar] frame];
    
    CGFloat minX = CGRectGetMinX(navigationBarFrame);
    CGFloat minY = CGRectGetMaxY(navigationBarFrame);
    CGFloat maxX = CGRectGetMaxX(self.view.frame);
    CGFloat maxY = CGRectGetMaxY(self.view.frame);
    
    CGFloat firstY = (maxY - minY) / 12 + minY;
    CGFloat secondY = (maxY - firstY) / 2 + firstY;

    //rects
    CGRect rectForTimer = CGRectMake(minX, minY, maxX, firstY - minY);
    CGRect rectForGame = CGRectMake(minX, firstY, maxX, maxY - firstY);
    CGRect drawSpaceForHuman = CGRectMake(minX, firstY, maxX, secondY - firstY);
    CGRect drawSpaceForGun = CGRectMake(minX, secondY, maxX, maxY - secondY);
    
    
    //adding gun
    [self addHumanInRect:rectForGame withDrawSpace:drawSpaceForHuman];

    //adding human
    [self addGunInRect:rectForGame withDrawSpace:drawSpaceForGun];
    
    //timer label
    [self startTimerInRect:rectForTimer];
    
    
}

- (void)barButtonItemClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    [timer invalidate];
}

- (void)timerEnds {
    //timer ends and game ends also
    if (seconds == 0) {
        NSLog(@"Timer ends");
        [timer invalidate];
        NSLog(@"Timer invalidated");
        
        UIThirdNavigationController *tvc = [[UIThirdNavigationController alloc] init];
        [self.navigationController pushViewController:tvc animated:true];
        
        [timer invalidate];
        [tvc release];

    } else {
        seconds -=1;
        _timerLabel.text = [NSString stringWithFormat:@"Time: %d", seconds];
        NSLog(@"minus 1 sec");
    }
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //timer
    seconds = 5;
    [_timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(timerEnds)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)startTimerInRect:(CGRect)rect {
    seconds = 5;

    _timerLabel = [[UILabel alloc] initWithFrame:rect];
    [_timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
    [_timerLabel setFont:[UIFont fontWithName:@"Helvetica" size:40]];
    
    _timerLabel.backgroundColor = [UIColor whiteColor];
    
    _timerLabel.textColor = [UIColor blackColor];
    [_timerLabel setTextAlignment:NSTextAlignmentCenter];
    [_timerLabel setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:_timerLabel];
}

- (void)addHumanInRect:(CGRect)rect withDrawSpace:(CGRect)drawSpace {
    
    Human* human = [[Human alloc] initWithFrame:rect];
    human.drawHumanSpace = drawSpace;
    human.backgroundColor = [UIColor clearColor];
    [self.view addSubview:human];
    [human autorelease];
}

- (void)addGunInRect:(CGRect)rect withDrawSpace:(CGRect)drawSpace {

    _gunView = [[Gun alloc] initWithFrame:rect];
    _gunView.backgroundColor = [UIColor clearColor];
    _gunView.drawingGunSpace = drawSpace;
    [self.view addSubview:_gunView];
    [_gunView  autorelease];
    
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
    NSLog(@"NAV2 | dealloc");
    [super dealloc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
