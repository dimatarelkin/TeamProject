//
//  UISecondNavigationController.h
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 15/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gun.h"
#import "Human.h"
#import "Shot.h"

@interface UISecondNavigationController : UIViewController
@property (weak, nonatomic) UILabel* timerLabel;
@property (weak, nonatomic) Gun* gunView;
@property (weak, nonatomic) Human* humanView;
@property (weak, nonatomic) Shot *shotView;

- (void)addGunAndHumanInRect:(CGRect)rect;
- (void)startTimerInRect:(CGRect)rect;
@end
