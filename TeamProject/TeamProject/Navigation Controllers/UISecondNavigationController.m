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
@property (weak, nonatomic) Shot *shotView;

//- (void)addHumanInRect:(CGRect)rect;
- (void)addGunAndHumanInRect:(CGRect)rect;
- (void)startTimerInRect:(CGRect)rect;

@end



@implementation UISecondNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"NAV2 | viewDidLoad");
    //title and background
    self.title = @"Game";
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
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
//    CGFloat secondY = (maxY - firstY) / 2 + firstY;

    //rects
    CGRect rectForTimer = CGRectMake(minX, minY, maxX, firstY - minY);
    CGRect rectForGame = CGRectMake(minX, firstY, maxX, maxY - firstY);
    
    //adding gun
//    [self addHumanInRect:rectForGame];

    //adding human
    [self addGunAndHumanInRect:rectForGame];
    
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
//        NSLog(@"Timer ends");
        [timer invalidate];
//        NSLog(@"Timer invalidated");
        
        UIThirdNavigationController *tvc = [[UIThirdNavigationController alloc] init];
        [self.navigationController pushViewController:tvc animated:true];
        
        [timer invalidate];
        [tvc release];

    } else {
        seconds -=1;
        _timerLabel.text = [NSString stringWithFormat:@"Time: %d", seconds];
//        NSLog(@"minus 1 sec");
    }
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //timer
//    seconds = 5;
//    [_timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
//    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                             target:self
//                                           selector:@selector(timerEnds)
//                                           userInfo:nil
//                                            repeats:YES];
}

- (void)startTimerInRect:(CGRect)rect {
    seconds = 5;

    _timerLabel = [[UILabel alloc] initWithFrame:rect];
    [_timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
    [_timerLabel setFont:[UIFont fontWithName:@"Helvetica" size:35]];

    _timerLabel.backgroundColor = [UIColor clearColor];

    _timerLabel.textColor = [UIColor blackColor];
    [_timerLabel setTextAlignment:NSTextAlignmentCenter];
    [_timerLabel setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:_timerLabel];
}

//- (void)addHumanInRect:(CGRect)rect {
//
//    Human* human = [[Human alloc] initWithFrame:rect];
//
//    human.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:human];
//    [human autorelease];
//}

- (void)addGunAndHumanInRect:(CGRect)rect {

    CGFloat newHeight = rect.size.height /5;
    CGFloat newWidth  = rect.size.width /5;
    CGFloat originX = CGRectGetMidX(rect) - newWidth /2;
    CGFloat originY = CGRectGetMaxY(rect) - newHeight;
    NSLog(@"%f,%f,%f,%f", newHeight, newWidth,originX,originY);
    
    // Gun init
    _gunView = [[Gun alloc] initWithFrame:CGRectMake(originX, originY, newWidth, newHeight)];
    _gunView.backgroundColor = [UIColor clearColor];

    [self.view addSubview:_gunView];
    [_gunView  autorelease];
    
    
    //Shot init
    _shotView = [[Shot alloc] initWithFrame:CGRectMake(originX + newWidth / 2,
                                                        originY,
                                                        10, 10)];
    //сетаем координату shot, где он всегда будет появляться
    [self.shotView setFirstState:CGPointMake(originX + newWidth / 2, originY)];
    [_shotView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_shotView];
    
    
    //Human init
    _humanView = [[Human alloc] initWithFrame:CGRectMake(200, 200, 100, 50)];
    
    _humanView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_humanView];
    [_humanView autorelease];
    [_humanView setShot:_shotView];
}


/* ===========================================Touches Handling methods=================================================*/

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    CGPoint myTouchPoint = [myTouch locationInView:myTouch.view];
    
    [_humanView setFlagHuman:NO];
    
    //Елси нажимаем на врага
    if(_humanView.flagHuman) {
        [_humanView touchesBegan:touches withEvent:event];
    } else {
        //СТАРТУЕМ И УКАЗЫВАЕМ КОНЕЧНУЮ ТОЧКУ ПОЛЁТА
        [_shotView startAnimationShot:myTouchPoint];
    }
    NSLog(@"TOUCHED VC %@", NSStringFromCGPoint(CGPointMake(myTouchPoint.x, myTouchPoint.y)));
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

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

- (void)dealloc {
//    NSLog(@"NAV2 | dealloc");
    [super dealloc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
*/
@end
