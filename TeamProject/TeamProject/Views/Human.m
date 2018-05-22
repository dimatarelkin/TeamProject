//
//  Human.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Human.h"
#import "Shot.h"
#import "UISecondNavigationController.h"

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
}

//Анимация при нажатии на врага (вызываем метод анимации из shot и передаём ему преобразованные координаты касания в системе NavController)
- (void) startShotAnimatuonWhenTouchHuman:(UITouch *) touch {
    CGPoint pointOfTouch = [touch locationInView:touch.view];
    CGPoint convertedInSuperview = [self convertPoint:pointOfTouch toView:self.superview];
    [_shot startAnimationShot:convertedInSuperview];
}


//анимация killHuman
- (void)moveView:(UIView*) view {
    self.counterKill += 1;
    NSLog(@"counterKill = %i", _counterKill);
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         //animation start
                         CGFloat randY = self.superview.frame.size.height * 0.3 + arc4random_uniform(rand()%200);
                         
//                         view.center = CGPointMake(CGRectGetWidth(view.bounds) - CGRectGetWidth(view.frame)/2, 150);
                         view.center = CGPointMake(CGRectGetWidth(view.bounds), randY);

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
                         CGAffineTransform scale = CGAffineTransformMakeScale(1,1);
                         
                         //transform
                         view.transform = scale;
                        [_timerCheck invalidate];
                        [self startHumanAnimation];
                     }];
    NSLog(@"MOVE VIew ENDED");
    [_timerCheck invalidate];
}

- (void) invalidatingTimer {
    [_timerCheck invalidate];
    NSLog(@"INVALIDATED TIMER");
}

- (void) startHumanAnimation {
    
    if(!_stopTimerBySeconds) {
        [CATransaction begin];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
        animation.duration = 1.f;
        [animation setFromValue:[NSValue valueWithCGPoint:CGPointMake(self.superview.frame.size.width,
                                                                      self.layer.position.y)]];
        [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(-(self.layer.frame.size.width), self.layer.position.y)]];
        animation.fillMode = kCAFillModeBoth;
        
        _timerCheck = [NSTimer scheduledTimerWithTimeInterval:0.1f repeats:YES block:^(NSTimer * _Nonnull timer) {
            [self.layer setPosition:self.layer.presentationLayer.position];
            NSLog(@"%@", NSStringFromCGPoint(self.layer.presentationLayer.position));
        }];
        [animation setRepeatCount:INFINITY];
        [self.layer addAnimation:animation forKey:@"anim"];
        [CATransaction commit];
    }
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    CALayer* myLayer = [[CALayer alloc] init];
    myLayer.frame = self.bounds;
    myLayer.backgroundColor = [UIColor clearColor].CGColor;
    [myLayer setContents:(id)[UIImage imageNamed:@"playingJet"].CGImage];
    myLayer.contentsGravity = kCAGravityResizeAspect;
    [self.layer addSublayer:myLayer];
    [myLayer release];
    
}

- (void)dealloc {
    [super dealloc];
    NSLog(@"HUMAN DEALLOCATED");
}

@end
