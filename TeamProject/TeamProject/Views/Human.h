//
//  Human.h
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shot.h"

@interface Human : UIView
@property(assign, nonatomic) CGRect drawHumanSpace;
//нужно, чтобы вызвать в методе Human вызвать метода Shot(Touches begin и запустить анимацию)
@property(weak, nonatomic) Shot *shot;
@property(assign, nonatomic) BOOL flagHuman;

- (void) startShotAnimatuonWhenTouchHuman:(UITouch *) touch;
- (void) killHumanAnimation;

@end
