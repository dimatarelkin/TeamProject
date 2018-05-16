//
//  Gun.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Gun.h"

@implementation Gun


- (void)drawRect:(CGRect)rect {
    // Drawing the gun
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    /*
     //making rects
     CGRect square1 = CGRectMake(100, 100, 100, 100);
     CGRect square2 = CGRectMake(200, 200, 100 ,100);
     CGRect square3 = CGRectMake(300, 300, 100 ,100);
     
     
     //    CGContextFillRect(context, rect);                                       // указать context  для фигуры
     //    CGContextSetStrokeColor(, );   //нарисовать границу
     
     
     //add rects to context
     CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);        // заполнить
     CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);   // borders
     
     CGContextAddRect(context, square1);
     CGContextAddRect(context, square2);
     CGContextAddRect(context, square3);
     
     CGContextSetLineWidth(context, 2.f);
     
     CGContextStrokePath(context);   // draw rect with borders
     //CGContextFillPath(context);   // draw rect with filling
     
     
     //add ellipses
     CGContextAddEllipseInRect(context, CGRectMake(100, 100, 100, 100));
     CGContextAddEllipseInRect(context, CGRectMake(200, 200, 100, 100));
     CGContextAddEllipseInRect(context, CGRectMake(300, 300, 100, 100));
     
     CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
     CGContextFillPath(context);
     
     //draw lines
     //first line
     CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));      // start from this point
     CGContextAddLineToPoint(context,CGRectGetMinX(square3), CGRectGetMaxY(square3));    // to end of this point
     
     //second line
     CGContextMoveToPoint(context, CGRectGetMaxX(square1), CGRectGetMinY(square1));
     CGContextAddLineToPoint(context,CGRectGetMaxX(square3), CGRectGetMinY(square3));
     
     //third line
     //    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMinY(square1));
     //    CGContextAddLineToPoint(context,CGRectGetMinX(square3), CGRectGetMinY(square3));
     
     //colors, width for all the lines
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);             // line color
     CGContextSetLineWidth(context, 2.f);                                                // line width
     CGContextSetLineCap(context, kCGLineCapRound);                                      // line cap (конец)
     CGContextStrokePath(context);                                                       // add lines to context
     
     //draw semi-circle
     //x ,y -center, clockwise = YES если по часовой, NO -против часовой
     CGContextAddArc(context, CGRectGetMaxX(square1), CGRectGetMaxY(square1), CGRectGetWidth(square1),
     M_PI, 0, YES);
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     CGContextStrokePath(context);
     
     //draw another semi-circle
     CGContextAddArc(context, CGRectGetMinX(square3), CGRectGetMinY(square3), CGRectGetWidth(square3),
     0, M_PI, YES);
     
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     CGContextStrokePath(context);
     
     //text drawing
     NSString* text = @"Random";
     
     UIFont* font = [UIFont systemFontOfSize:14.f];
     
     NSShadow* shadow = [[NSShadow alloc] init];
     shadow.shadowOffset = CGSizeMake(1.f, 1.f);
     shadow.shadowColor = [UIColor orangeColor];
     shadow.shadowBlurRadius = 0.5f;
     
     
     
     //add attributes to our font
     NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:
     [UIColor whiteColor], NSForegroundColorAttributeName,  //color
     font,                NSFontAttributeName,              //font
     shadow,              NSShadowAttributeName,nil];       //shadow
     
     CGSize textSize = [text sizeWithAttributes:attributes];
     
     //отрисовываем текст в центре square2
     CGRect textRect = CGRectMake(CGRectGetMidX(square2) - textSize.width /2,
     CGRectGetMidY(square2) - textSize.height/2,
     textSize.width, textSize.height);
     
     textRect = CGRectIntegral(textRect); //округляет
     [text drawInRect:textRect withAttributes:attributes];
     //    [text drawAtPoint:CGPointMake(CGRectGetMidX(square2) - textSize.width /2, CGRectGetMidY(square2)- textSize.height/2)
     //       withAttributes:attributes];
     */
    
}

- (void)dealloc {
    NSLog(@"gun deallocated");
    [super dealloc];
    
    
}
@end
