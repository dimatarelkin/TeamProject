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
@property (retain, nonatomic, readwrite) Shot *whizbang;
@property (assign, nonatomic) CGPoint shotStartPoint;
@end

@implementation Gun
@synthesize whizbang = _whizbang;

// я создал этот init и переопределял его специально для того,
// чтобы создать whizbang. А сейчас он же и не нужен.

//- (id) initWithFrame:(CGRect)frame {
//
//    // сюда пришел наш gunRect он теперь frame
//    // то есть в drawRect self.frame будет равне нашему frame = gunRect
//
//    [super initWithFrame:frame];
//    return self;
//}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _whizbang = [[Shot alloc] initWithFrame:CGRectMake(_shotStartPoint.x, _shotStartPoint.y, 16, 16)];
    
//    _whizbang = [[Shot alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 10, 10)];
    [self.whizbang setAlpha:0];
    [self.whizbang setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_whizbang];
    [self.whizbang setAlpha:1];
    [_whizbang touchesBegan:touches withEvent:event];
    
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_whizbang touchesMoved:touches withEvent:event];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_whizbang touchesEnded:touches withEvent:event];
    [_whizbang release];
}


- (void) dealloc {
    NSLog(@"Gun deallocated");
    [super dealloc];
}



- (void)drawRect:(CGRect)rect {
    // Drawing the gun
    NSLog(@"Gun frame %@",NSStringFromCGRect(_drawingGunSpace));

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    
    CGFloat centerX = CGRectGetMidX(_drawingGunSpace);
    CGFloat centerY = CGRectGetMidY(_drawingGunSpace);
    _shotStartPoint = CGPointMake(centerX - 8, centerY); // минус половина толщины снаряда, если у снаряда width - 10, то минус 5
    
    //constraionts
    CGFloat deltaX = 8;                        //можно менять размер пушки
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
    CGPoint rightWheelPoint = CGPointMake(beginPoint.x + 2 * deltaX + offset, beginPoint.y + 0.6 *deltaY);
    CGContextAddEllipseInRect(context, CGRectMake(rightWheelPoint.x, rightWheelPoint.y, deltaX, 0.8 * deltaY ));

    //левое колесо
    CGPoint leftWheelPoint = CGPointMake(beginPoint.x - offset - deltaX, beginPoint.y + 0.6 *deltaY);
    CGContextAddEllipseInRect(context, CGRectMake(leftWheelPoint.x, leftWheelPoint.y, deltaX, 0.8 * deltaY ));
    
    //color
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    
    
}

@end
