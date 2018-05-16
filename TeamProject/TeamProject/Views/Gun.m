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
    
}

- (void)dealloc {
    NSLog(@"gun deallocated");
    [super dealloc];
    
    
}
@end
