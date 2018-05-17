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
@property(retain, nonatomic, readwrite) Shot *whizbang;
@end

@implementation Gun
@synthesize whizbang = _whizbang;


- (id) initWithFrame:(CGRect)frame {
    [super initWithFrame:frame];
    _whizbang = [[Shot alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 10, 10)];
    [self.whizbang setAlpha:0];
    [self.whizbang setBackgroundColor:[UIColor blackColor]];
    [self addSubview:_whizbang];
    return self;
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.whizbang setAlpha:1];
    [_whizbang touchesBegan:touches withEvent:event];
}

- (void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_whizbang touchesMoved:touches withEvent:event];
    
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_whizbang touchesEnded:touches withEvent:event];
}


- (void) dealloc {
    [_whizbang release];
    [super dealloc];
}





//- (void)drawRect:(CGRect)rect {
//    // Drawing the gun
//
//    NSLog(@"%@",NSStringFromCGRect(self.frame));
//}

@end
