//
//  Human.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Human.h"

@implementation Human

- (void)drawRect:(CGRect)rect {
    // Drawing code
        CALayer* myLayer = [[CALayer alloc] init];
        myLayer.frame = self.bounds;
        [myLayer setContents:(id)[UIImage imageNamed:@"fighter-jet"].CGImage];
        [self.layer addSublayer:myLayer];
        [myLayer release];
}

- (void)dealloc {
    [super dealloc];
}

@end
