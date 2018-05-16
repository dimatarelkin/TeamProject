//
//  Game.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Game.h"
#import "Gun.h"
#import "Human.h"

@implementation Game

#pragma mark - Game -

- (void)startGame {
    
//gun

    
//Human
    //[self setHuman:humanInit];
    
// timer
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:60.0
                                                      target:self
                                                    selector:@selector(timerEnds)
                                                    userInfo:nil
                                                     repeats:NO];
}

#pragma mark - End Of Game -
- (void)timerEnds {
    //timer ends and game ends also
    
}

- (void)dealloc {
    
}

@end
