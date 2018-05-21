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
    NSTimer* timer;
}

@property (weak, nonatomic) UILabel* timerLabel;
@property (weak, nonatomic) Gun* gunView;
@property (weak, nonatomic) Human* humanView;
@property (weak, nonatomic) Shot *shotView;

- (void)addGunAndHumanInRect:(CGRect)rect;
- (void)startTimerInRect:(CGRect)rect;

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
}

- (void)startTimerInRect:(CGRect)rect {
    //отрисовка таймера из viewDidLoad
    _timerLabel = [[UILabel alloc] initWithFrame:rect];
    [_timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
    [_timerLabel setFont:[UIFont fontWithName:@"AvenirNext-Heavy" size:40]];
    _timerLabel.backgroundColor = [UIColor clearColor];
    _timerLabel.textColor = [UIColor blackColor];
    [_timerLabel setTextAlignment:NSTextAlignmentCenter];
    [_timerLabel setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:_timerLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //запуск таймера
    seconds = 30;
    [_timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
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
        
        //release objects
        [tvc release];

    } else {
        seconds -=1;
        _timerLabel.text = [NSString stringWithFormat:@"Time: %d", seconds];
    }
}

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
    _shotView = [[Shot alloc] initWithFrame:CGRectMake(originX + newWidth / 2 - 6, originY +20, 6, 6)];
    [self.shotView setFirstState:CGPointMake(originX + newWidth / 2, originY)];
    [_shotView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_shotView];
    
    //Human init
    CGFloat randomX = arc4random_uniform(200);
    CGFloat randomY = 100 + arc4random_uniform(200);
    _humanView = [[Human alloc] initWithFrame:CGRectMake(randomX, randomY, 85, 40)];
    _humanView.backgroundColor = [UIColor clearColor];
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
        [_humanView.layer removeAllAnimations];
    } else {
        //СТАРТУЕМ И УКАЗЫВАЕМ КОНЕЧНУЮ ТОЧКУ ПОЛЁТА
        [_shotView startAnimationShot:myTouchPoint];
    }
//    NSLog(@"TOUCHED VC %@", NSStringFromCGPoint(CGPointMake(myTouchPoint.x, myTouchPoint.y)));
    NSLog(@"%@", NSStringFromCGPoint(_humanView.layer.presentationLayer.position));
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
    //    NSLog(@"NAV2 | dealloc");
    [super dealloc];
    
}
@end
