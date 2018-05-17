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
    
    // сюда пришел наш gunRect он теперь frame
    // то есть в drawRect self.frame будет равне нашему frame = gunRect
    
    [super initWithFrame:frame];
    return self;
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _whizbang = [[Shot alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 10, 10)];
    [self.whizbang setAlpha:0];
    [self.whizbang setBackgroundColor:[UIColor blackColor]];
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
//    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 368, 40, 40)];
//    view.backgroundColor = [UIColor blackColor];
//    [self addSubview:view];
    
    NSLog(@"Gun %@",NSStringFromCGRect(self.frame));
}

@end
