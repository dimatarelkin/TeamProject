//
//  Shot.h
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Shot : UIView
@property(assign, nonatomic) CGPoint firstState;
@property(assign, nonatomic, readonly) CFTimeInterval durationForMainAnimation;

- (void) startAnimationShot:(CGPoint) endPoint;
- (void) blastTheShot;

@end
