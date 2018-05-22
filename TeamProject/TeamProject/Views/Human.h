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
//для получения текущих координат
@property(weak, nonatomic) NSTimer *timerCheck;
//подсчет килов
@property(assign, nonatomic) int counterKill;
//остановка внутреннего таймера аниации
@property(assign, nonatomic) BOOL stopTimerBySeconds;

- (void) startShotAnimatuonWhenTouchHuman:(UITouch *) touch;
- (void) startHumanAnimation;
- (void) invalidatingTimer;
- (void) removeAnim;
@end
