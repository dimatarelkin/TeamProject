//
//  Gun.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Gun.h"
#import "Shot.h"

@interface Gun()
//@property (assign, nonatomic) CGPoint shotStartPoint;
@end

@implementation Gun

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    CGPoint pointOfTouch = [myTouch locationInView:myTouch.view];
    
    CGPoint convertedGunPointInSuperviewPoint = [self convertPoint:pointOfTouch toView:self.superview];
    NSLog(@"TOUCHED MYGUN RECT: %@", NSStringFromCGPoint(convertedGunPointInSuperviewPoint));
}


- (void) dealloc {
    NSLog(@"Gun deallocated");
    [super dealloc];
}



- (void)drawRect:(CGRect)rect {
    // Drawing the gun
//    NSLog(@"Gun frame %@",NSStringFromCGRect(_drawingGunSpace));

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    
  
    
    
    CGFloat centerX = CGRectGetMidX(rect);
    CGFloat centerY = CGRectGetMinY(rect);
    //!!!Координата, где всегда будет появляться shot!!! (firstState та же _shotStartPoint)
    _shotStartPoint = CGPointMake(centerX - 8, centerY); // минус половина толщины снаряда, если у снаряда width - 10, то минус 5
//    //???
//    _shotStartPoint = _shot.firstState;

    //constraionts
    CGFloat deltaX = 7;                        //можно менять размер пушки
    CGFloat deltaY = deltaX * 8;
    CGFloat offset = deltaX * 3/2;
    CGPoint beginPoint = CGPointMake(centerX - deltaX, centerY + deltaX);

    //gun shape
    CGContextMoveToPoint(context, beginPoint.x, beginPoint.y);
    CGContextAddLineToPoint(context, beginPoint.x + 2 * deltaX, beginPoint.y);
    CGContextAddLineToPoint(context, beginPoint.x + 2 * deltaX + offset, beginPoint.y + deltaY);
    CGContextAddLineToPoint(context, beginPoint.x + deltaX, beginPoint.y + deltaY + offset);
    CGContextAddLineToPoint(context, beginPoint.x - offset, beginPoint.y + deltaY);
    CGContextClosePath(context);

    //правое колесо
    CGFloat wheelSize = 0.8;   //wheel size

    CGPoint rightWheelPoint = CGPointMake(beginPoint.x + 2 * deltaX + offset, beginPoint.y + wheelSize * deltaY);
    CGContextAddEllipseInRect(context, CGRectMake(rightWheelPoint.x, rightWheelPoint.y, deltaX, (1 - wheelSize) * 2 * deltaY));
    //левое колесо
    CGPoint leftWheelPoint = CGPointMake(beginPoint.x - offset - deltaX, beginPoint.y + wheelSize * deltaY);
    CGContextAddEllipseInRect(context, CGRectMake(leftWheelPoint.x, leftWheelPoint.y, deltaX, (1 - wheelSize) * 2 * deltaY));
    
    //color
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
      
}

@end
