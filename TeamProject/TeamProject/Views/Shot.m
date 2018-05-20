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
    
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *myTouch = [[event allTouches] anyObject];
//    [self.class animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        
//        CGFloat x = [myTouch locationInView:myTouch.view].x;
//        CGFloat X = x;
//        
//        //
//        [self setCenter:CGPointMake(X, -300)];
//    
//    } completion:nil];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
}

- (void)dealloc {
    NSLog(@"shot deallocated");
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.backgroundColor = [UIColor clearColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, rect);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
    
}


@end
