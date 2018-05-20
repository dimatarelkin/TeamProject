//
//  Gun.h
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"


@interface Gun : UIView
@property (assign, nonatomic) CGRect drawingGunSpace;
@property (assign, nonatomic) CGPoint shotStartPoint;
//???
//@property(retain, nonatomic) Shot *shot;
@end
