//
//  Shot.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Shot.h"

@implementation Shot

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    [self.class animateWithDuration:1.f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGFloat X = [myTouch locationInView:myTouch.view].x;
        [self setCenter:CGPointMake(X, -300)];
    } completion:nil];
    
    
    /*
    Теперь летает в нужном направлении
    При выстреле снаряд летит по своему ректанглу gunRectangle(снаряд виден) при вылете на другой рект(HumanRect) он летит как бы под ним (хотя по логике все ректанглы на одном view и в иерархии на одном уровне....)
    ПРЕДЛАГАЮ сделать один ректангл для Gun и Human - тогда все будет ок(предполагаю) и Снаряд будет лететь только по своему большому ректанглу (Завтра ещё 1 предложение сделаю по поводу вычисления размеров этих rect)
    */
    
    
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    
    
    [self.class animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        CGFloat x = [myTouch locationInView:myTouch.view].x;
        CGFloat X = x;
        [self setCenter:CGPointMake(X, -300)];
        
        
        
    } completion:nil];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void)dealloc {
    NSLog(@"shot deallocated");
    [super dealloc];
}

//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}


@end
