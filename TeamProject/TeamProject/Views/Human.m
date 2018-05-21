//
//  Human.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Human.h"
#import "Shot.h"

@implementation Human


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    CGPoint pointOfMyTouch = [myTouch locationInView:myTouch.view];
    //коевертнули коорд касания по врагу в коорд нашего view NavContr ЧИСТО ДЛЯ LOG
    CGPoint convertedPointOfMyTouchToSUPERVIEW = [self convertPoint:pointOfMyTouch toView:self.superview];
    NSLog(@"TOUCHED ON ENEMY %@", NSStringFromCGPoint(convertedPointOfMyTouchToSUPERVIEW));
    
    
    [self startShotAnimatuonWhenTouchHuman:myTouch];
    
    //сравнение, попадает ли снаряд в цель
    if(CGRectContainsPoint(self.layer.presentationLayer.frame, _shot.endState)) {
        _flagHuman = YES;
        //валит прилагу
//        [self performSelector:@selector(invalidate) withObject:nil afterDelay:[_shot durationForMainAnimation]];
        
         //начинаем анамацию с задержкой
        [self performSelector:@selector(killHumanAnimation) withObject:nil afterDelay:([_shot durationForMainAnimation] + 0.1f)];
//        [self performSelector:@selector(invalidatingTimer) withObject:nil afterDelay:[_shot durationForMainAnimation]];
//        NSLog(@"PAYSE");
//        [self performSelector:@selector(pauseLayer) withObject:nil afterDelay:([_shot durationForMainAnimation] + 0.1f)];
//        [self pauseLayer:self.layer];
        NSLog(@"YYYYYYYYEEEEESSS");
    } else {
        NSLog(@"NOOOOOOO");
    }
    
}

//Анимация при нажатии на врага (вызываем метод анимации из shot и передаём ему преобразованные координаты касания в системе NavController)
- (void) startShotAnimatuonWhenTouchHuman:(UITouch *) touch {
    CGPoint pointOfTouch = [touch locationInView:touch.view];
    CGPoint convertedInSuperview = [self convertPoint:pointOfTouch toView:self.superview];
    [_shot startAnimationShot:convertedInSuperview];
}

- (void) killHumanAnimation {
    //работает на слоях(CABasicAnimation) UIView animateWithDuration - не хочет
//    [self setAlpha:0];
//    [self pauseLayer];
//    [[self timerCheck] invalidate];
    [self.layer.presentationLayer removeAllAnimations];
    [self.layer setPosition:CGPointMake(300, 500)];
    [self startHumanAnimation];
}

- (void) anitamationAfterKillHuman {
    NSLog(@"DYING FLIGHT IN SPACE)))");
}

//останавливает human(pause)
- (void) pauseLayer {
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = pausedTime;
}

- (void) invalidatingTimer {
    [_timerCheck invalidate];
    NSLog(@"INVALIDATED TIMER");
}

- (void) pattertnAnimation:(CABasicAnimation *)animation x:(CGFloat)x y:(CGFloat)y duration:(CFTimeInterval)time {
    animation.duration = time;
    animation.beginTime = CACurrentMediaTime() + 0.5f;
    [animation setFromValue:[NSValue valueWithCGPoint:self.layer.position]];
    [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
}
- (void) startHumanAnimation {
    //Random, но кривой(
//    CGFloat lowX = 50;
//    CGFloat maxX = 100;
//    CGFloat lowY = 45;
//    CGFloat maxY = 105;
//    CGFloat X = (((CGFloat)arc4random()/0x100000000)*(maxX-lowX)+lowX);
//    CGFloat Y = (((CGFloat)arc4random()/0x100000000)*(maxY-lowY)+lowY);
    [self setAlpha:1];
    [CATransaction begin];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    _timerCheck = [NSTimer scheduledTimerWithTimeInterval:0.1f repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self.layer setPosition:self.layer.presentationLayer.position];
        NSLog(@"%@", NSStringFromCGPoint(self.layer.presentationLayer.position));
    }];
    [self pattertnAnimation:animation x:50 y:290 duration:3.f];

    [CATransaction setCompletionBlock:^{
//        [timer invalidate];
        [CATransaction begin];
        CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
        [self pattertnAnimation:animation2 x:150 y:100 duration:3.f];
        
        [CATransaction setCompletionBlock:^{
            [CATransaction begin];
            CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"position"];
            [self pattertnAnimation:animation3 x:180 y:380 duration:0.5f];
            
            [CATransaction setCompletionBlock:^{
//                [[self timerCheck] invalidate];
            }];
            [self.layer addAnimation:animation3 forKey:@"anim3"];
            
            [CATransaction commit];
        }];
        [self.layer addAnimation:animation2 forKey:@"anim2"];
        
        [CATransaction commit];
    }];
    
    [self.layer addAnimation:animation forKey:@"anim"];
    
    [CATransaction commit];
}


- (void)drawRect:(CGRect)rect {
///<<<<<<< HEAD
    // Drawing code
    CALayer* myLayer = [[CALayer alloc] init];
    myLayer.frame = self.bounds;
    [myLayer setContents:(id)[UIImage imageNamed:@"fighter-jet"].CGImage];
    myLayer.contentsGravity = kCAGravityResizeAspect;
    [self.layer addSublayer:myLayer];
    [myLayer release];

//=======
//        CALayer* myLayer = [[CALayer alloc] init];
//        myLayer.frame = self.bounds;
//        [myLayer setContents:(id)[UIImage imageNamed:@"fighter-jet"].CGImage];
//        [self.layer addSublayer:myLayer];
//        [myLayer release];
//>>>>>>> localAnimation22
}

- (void)dealloc {
    [super dealloc];
}

@end
