//
//  Shot.h
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Shot : UIView
@property (assign, nonatomic) CGFloat length;           // дальность
@property (assign, nonatomic) CGFloat maxHeight;        // максимальная высота
@property (assign, nonatomic) CGFloat shootTime;        // время
@property (assign, nonatomic) CGFloat angle;            // угол выстрела
@property (assign, nonatomic) CGFloat startingSpeed;    // начальная скорость

- (void)ballistics;

@end
