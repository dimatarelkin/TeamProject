//
//  Human.h
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Shot;

@interface Human : UIView
@property(assign, nonatomic) CGRect drawHumanSpace;
//нужно, чтобы вызвать в методе Human вызвать метода Shot(Touches begin и запустить анимацию)
@property(weak, nonatomic) Shot *shot;
//отсдеживает касания по human
@property(assign, nonatomic) BOOL flagHuman;
//
@property(weak, nonatomic) NSTimer *timerCheck;

- (void) startShotAnimatuonWhenTouchHuman:(UITouch *) touch;

- (void) startHumanAnimation;
- (void) pattertnAnimation:(CABasicAnimation *)animation x:(CGFloat)x y:(CGFloat)y duration:(CFTimeInterval)time;

- (void) killHumanAnimation;
- (void) anitamationAfterKillHuman;

- (void) pauseLayer;
- (void) invalidatingTimer;

@end
