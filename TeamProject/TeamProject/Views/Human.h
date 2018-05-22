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
//для получения текущих координат
@property(weak, nonatomic) NSTimer *timerCheck;
//подсчет килов
@property(assign, nonatomic) int counterKill;

@property(assign, nonatomic) BOOL stopTimerBySeconds;
- (void) startShotAnimatuonWhenTouchHuman:(UITouch *) touch;

- (void) startHumanAnimation;
- (void) pattertnAnimation:(CABasicAnimation *)animation x:(CGFloat)x y:(CGFloat)y duration:(CFTimeInterval)time;

- (void) anitamationAfterKillHuman;

- (void) pauseLayer;
- (void) invalidatingTimer;
- (void) removeAnim;
@end
