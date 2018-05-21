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
    //В МЕТОД ДОБАВИЛ ТОЛЬКО АЛЬФУ, СЕТ НЕ ДОБАВЛЯЛ И АНАМАЦИЯ НАЧИНАЕТСЯ С ПУШКИ КАК ОБЫЧНО
    //?????
//    [self setFrame:CGRectMake(_firstState.x, _firstState.y, 10, 10)];
    
    
    UITouch *myTouch = [[event allTouches] anyObject];
    CGPoint pointOfTouch = [myTouch locationInView:myTouch.view];
    //ТУТ УКАЗЫВАЕМ КОНЕЧНУЮ ТОЧКУ
    [self startAnimationShot:pointOfTouch];
}


- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}


//перенёс в отдельный метод
- (void) startAnimationShot:(CGPoint) EndPoint {
    //оживляем снаряд
    self.alpha = 1;
    //    UITouch *myTouch = [[event allTouches] anyObject];
    //    CGPoint pointOfTouch = [touch locationInView:touch.view];
    
    //анимация
    [CATransaction begin];
    CABasicAnimation *myAnymation = [CABasicAnimation animationWithKeyPath:@"position"];
    [myAnymation setDuration:1.f];
    //self.layer.position.x
    [myAnymation setFromValue:[NSValue valueWithCGPoint:CGPointMake(_firstState.x, _firstState.y)]];
    [myAnymation setToValue:[NSValue valueWithCGPoint:CGPointMake(EndPoint.x,
                                                                  EndPoint.y)]];
    [CATransaction setCompletionBlock:^{
        NSLog(@"END OF ANIMATION!!!");
        //делаем пересет координат по завершении анимации МЕНЯЮ ТУТ РАНЬШЕ БЫЛИ
        [self setCenter:CGPointMake(EndPoint.x, EndPoint.y)];
        [self blastTheShot];
    }];
    
    [self.layer addAnimation:myAnymation forKey:@"animate"];
    [CATransaction commit];
}

//анимация для complition block
- (void) blastTheShot {
    NSLog(@"SHOT BLASTED");
    [self.class animateWithDuration:3.f animations:^{
        self.alpha = 0;
    }];
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
