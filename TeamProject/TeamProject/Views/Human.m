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
        
//        [self performSelector:@selector(invalidatingTimer) withObject:nil afterDelay:[_shot durationForMainAnimation]];
//        NSLog(@"PAYSE");
//        [self performSelector:@selector(pauseLayer) withObject:nil afterDelay:([_shot durationForMainAnimation] + 0.1f)];
        [self performSelector:@selector(removeAnim) withObject:nil afterDelay:([_shot durationForMainAnimation] + 0.1f)];
        //      //начинаем анамацию с задержкой
        [self performSelector:@selector(moveView:) withObject:self afterDelay:([_shot durationForMainAnimation])];
        NSLog(@"YYYYYYYYEEEEESSS");
    } else {
        NSLog(@"NOOOOOOO");
    }
    
}

- (void) removeAnim {
    [self.layer removeAnimationForKey:@"anim"];
//    [self.layer removeAnimationForKey:@"anim2"];
//    [self.layer removeAnimationForKey:@"anim3"];
}

//Анимация при нажатии на врага (вызываем метод анимации из shot и передаём ему преобразованные координаты касания в системе NavController)
- (void) startShotAnimatuonWhenTouchHuman:(UITouch *) touch {
    CGPoint pointOfTouch = [touch locationInView:touch.view];
    CGPoint convertedInSuperview = [self convertPoint:pointOfTouch toView:self.superview];
    [_shot startAnimationShot:convertedInSuperview];
}

- (void) killHumanAnimation {
    NSLog(@"killHumanAnimation");
//    [CATransaction begin];
    [self moveView:self];
    
//    CABasicAnimation *death = [CABasicAnimation animationWithKeyPath:@"position"];
//
//    [self.layer addAnimation:death forKey:@"death"];
//    [CATransaction commit];
}

- (void)moveView:(UIView*) view {
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         //animation start
                         view.center = CGPointMake(CGRectGetWidth(view.bounds) - CGRectGetWidth(view.frame)/2, 150);

                         //changing color when view in change position
                         view.backgroundColor = [UIColor clearColor];             // [self randomColor];
                         NSLog(@"%@", NSStringFromCGPoint(view.center));
                         
                         //all transforms at the same time
                         CGAffineTransform scale = CGAffineTransformMakeScale(0.00001,0.00001);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI);
                         CGAffineTransform translation = CGAffineTransformMakeTranslation(rand() % 500, rand() % 600);
                         
                         //sum up matrix
                         CGAffineTransform transformScaleRotation = CGAffineTransformConcat(scale, rotation);
                         CGAffineTransform transformAll = CGAffineTransformConcat (transformScaleRotation, translation);
                         
                         //transform
                         view.transform = transformAll;
                         
                     }
                     completion:^(BOOL finished) {
                         //animation end
                         NSLog(@"First animation ends with %@", finished ? @"YES":@"NO");
                     }];
}

- (void) invalidatingTimer {
    [_timerCheck invalidate];
    NSLog(@"INVALIDATED TIMER");
}

- (void) startHumanAnimation {
    [CATransaction begin];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 1.f;
//    animation.beginTime = CACurrentMediaTime();
    [animation setFromValue:[NSValue valueWithCGPoint:self.layer.position]];
    [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(50, self.layer.position.y)]];
//    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeBoth;
    _timerCheck = [NSTimer scheduledTimerWithTimeInterval:0.1f repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self.layer setPosition:self.layer.presentationLayer.position];
//        NSLog(@"%@", NSStringFromCGPoint(self.layer.presentationLayer.position));
    }];
    [animation setAutoreverses:YES];
    [animation setRepeatCount:INFINITY];
    [self.layer addAnimation:animation forKey:@"anim"];
    [CATransaction commit];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    CALayer* myLayer = [[CALayer alloc] init];
    myLayer.frame = self.bounds;
    [myLayer setContents:(id)[UIImage imageNamed:@"fighter-jet"].CGImage];
    myLayer.contentsGravity = kCAGravityResizeAspect;
    [self.layer addSublayer:myLayer];
    [myLayer release];
}

- (void)dealloc {
    [super dealloc];
}

@end


//Random, но кривой(
//    CGFloat lowX = 50;
//    CGFloat maxX = 100;
//    CGFloat lowY = 45;
//    CGFloat maxY = 105;
//    CGFloat X = (((CGFloat)arc4random()/0x100000000)*(maxX-lowX)+lowX);
//    CGFloat Y = (((CGFloat)arc4random()/0x100000000)*(maxY-lowY)+lowY);
//    [self setAlpha:1];



//- (void) anitamationAfterKillHuman {
//    NSLog(@"AnimationAfterKillHuman");
//}

//останавливает human(pause)
//- (void) pauseLayer {
//    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
//    self.layer.speed = 0.0;
//    self.layer.timeOffset = pausedTime;
//}




//    [self pattertnAnimation:animation x:50 y:290 duration:3.f];
//    [animation setAutoreverses:YES];
//    [animation setRepeatCount:2];
//
//    [CATransaction setCompletionBlock:^{
////        [timer invalidate];
//        [CATransaction begin];
//        CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
//        [self pattertnAnimation:animation2 x:150 y:100 duration:3.f];
//
//        [CATransaction setCompletionBlock:^{
//            [CATransaction begin];
//            CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"position"];
//            [self pattertnAnimation:animation3 x:250 y:250 duration:3.f];
//
//            [CATransaction setCompletionBlock:^{
////                [[self timerCheck] invalidate];
//            }];
//            [self.layer addAnimation:animation3 forKey:@"anim3"];
//
//            [CATransaction commit];
//        }];
//        [self.layer addAnimation:animation2 forKey:@"anim2"];
//
//        [CATransaction commit];
//    }];
//
//    [self.layer addAnimation:animation forKey:@"anim"];
//
//    [CATransaction commit];


//- (void) pattertnAnimation:(CABasicAnimation *)animation x:(CGFloat)x y:(CGFloat)y duration:(CFTimeInterval)time {
//    animation.duration = time;
//    animation.beginTime = CACurrentMediaTime();
//    [animation setFromValue:[NSValue valueWithCGPoint:self.layer.position]];
//    [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
//    animation.removedOnCompletion = YES;
//    animation.fillMode = kCAFillModeBoth;
//}
