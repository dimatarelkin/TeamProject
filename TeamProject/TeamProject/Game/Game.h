//
//  Game.h
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Gun, Human;


@interface Game : NSObject
@property (assign,nonatomic) NSInteger score;
- (void) startGame;
@end
