//
//  Shot.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Shot.h"

@implementation Shot
@synthesize firstState = _firstState;

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //Касание и координата касания
    UITouch *myTouch = [[event allTouches] anyObject];
    CGPoint pointOfTouch = [myTouch locationInView:myTouch.view];
    
    //Оживляем кнопку после исчезновения и делаем пересет координат(которые делали в complition ^Block)
    self.alpha = 1;
    [self setFrame:CGRectMake(_firstState.x, _firstState.y, 7, 7)];
    
    //анимация
    [CATransaction begin];
    CABasicAnimation *myAnymation = [CABasicAnimation animationWithKeyPath:@"position"];
    [myAnymation setDuration:0.1f];
    //self.layer.position.x
    [myAnymation setFromValue:[NSValue valueWithCGPoint:CGPointMake(_firstState.x, _firstState.y)]];
    [myAnymation setToValue:[NSValue valueWithCGPoint:CGPointMake(pointOfTouch.x, pointOfTouch.y)]];
    [CATransaction setCompletionBlock:^{
        NSLog(@"END OF ANIMATION!!!");
        [self setCenter:CGPointMake(pointOfTouch.x, pointOfTouch.y)];
        [UIView animateWithDuration:0.5f animations:^{
            self.alpha = 0;
        }];
    }];
    
    [self.layer addAnimation:myAnymation forKey:@"animate"];
    [CATransaction commit];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}


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
