//
//  Shot.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Shot.h"

@interface Shot()
@property(assign, nonatomic, readwrite) CFTimeInterval durationForMainAnimation;
@end

@implementation Shot
@synthesize firstState = _firstState;

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    CGPoint pointOfTouch = [myTouch locationInView:myTouch.view];
    //ТУТ УКАЗЫВАЕМ КОНЕЧНУЮ ТОЧКУ
    [self startAnimationShot:pointOfTouch];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}


//перенёс в отдельный метод
- (void) startAnimationShot:(CGPoint) EndPoint {
    self.durationForMainAnimation = 2.f;
    //оживляем снаряд
    self.alpha = 1;
    
    //анимация
    [CATransaction begin];
    CABasicAnimation *myAnymation = [CABasicAnimation animationWithKeyPath:@"position"];
    [myAnymation setDuration:_durationForMainAnimation];
    [myAnymation setFromValue:[NSValue valueWithCGPoint:CGPointMake(_firstState.x, _firstState.y)]];
    [myAnymation setToValue:[NSValue valueWithCGPoint:CGPointMake(EndPoint.x,EndPoint.y)]];//self.layer.position.x(были раньше)
    [CATransaction setCompletionBlock:^{
        NSLog(@"END OF ANIMATION!!!");
         //делаем пересет координат по завершении анимации
        [self setCenter:CGPointMake(EndPoint.x, EndPoint.y)];//pointOfTouch.x, pointOfTouch.y (раньше)
        [self blastTheShot];
    }];
    [self.layer addAnimation:myAnymation forKey:@"animate"];
    [CATransaction commit];
}

//анимация для complition block
- (void) blastTheShot {
    NSLog(@"SHOT BLASTED");
    [self.class animateWithDuration:1.f animations:^{
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
