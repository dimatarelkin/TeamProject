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
    
    [game autorelease];
    
    //adding gun
    Gun* gun = [[Gun alloc] initWithFrame:CGRectMake(40, 600, 100, 100)];
    gun.backgroundColor = [UIColor blackColor];
    [self.view addSubview:gun];
    
    [gun  autorelease];
    
    
    //adding human
    Human* human = [[Human alloc] initWithFrame:CGRectMake(300, 100, 100, 100)];
    human.backgroundColor = [UIColor redColor];
    [self.view addSubview:human];
    
    [human autorelease];
    
    //timer label
    seconds = 5;
    _timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 150, 50)];
    [_timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
    _timerLabel.backgroundColor = [UIColor clearColor];
    _timerLabel.textColor = [UIColor blackColor];
    [_timerLabel setTextAlignment:NSTextAlignmentCenter];
    [_timerLabel setAdjustsFontSizeToFitWidth:YES];
    [self.view addSubview:_timerLabel];
    
}

- (void)barButtonItemClick:(id)sender {
    UIThirdNavigationController *tvc = [[UIThirdNavigationController alloc] init];
    [self.navigationController pushViewController:tvc animated:true];
    
    [tvc release];

}

- (void)timerEnds {
    //timer ends and game ends also
    if (seconds == 0) {
        NSLog(@"Timer ends");
        [timer invalidate];
        NSLog(@"Timer invalidated");
        [self barButtonItemClick:nil];

    } else {
        seconds -=1;
        _timerLabel.text = [NSString stringWithFormat:@"Time: %d", seconds];
        
        NSLog(@"minus 1 sec");
    }
   
    
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
    //timer
    seconds = 5;
    [_timerLabel setText:[NSString stringWithFormat:@"Time: %d", seconds]];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(timerEnds)
                                           userInfo:nil
                                            repeats:YES];
    
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
