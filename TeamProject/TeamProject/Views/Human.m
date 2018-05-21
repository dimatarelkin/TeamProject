//
//  Human.m
//  TeamProject
//
//  Created by Dmitriy Tarelkin on 16/5/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import "Human.h"

@implementation Human


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [[event allTouches] anyObject];
    CGPoint pointOfMyTouch = [myTouch locationInView:myTouch.view];
    //коевертнули коорд касания по врагу в коорд нашего view NavContr ЧИСТО ДЛЯ LOG
    CGPoint convertedPointOfMyTouchToSUPERVIEW = [self convertPoint:pointOfMyTouch toView:self.superview];
    NSLog(@"TOUCHED ON ENEMY %@", NSStringFromCGPoint(convertedPointOfMyTouchToSUPERVIEW));
    
    _flagHuman = YES;
    
    [self startShotAnimatuonWhenTouchHuman:myTouch];
    
    
    //сравниваем конечную координату полёта снаряда в frame врага. (Координата снаряда в системе view NavContr)
    //P.S shot - только анимируемая вьюха, касание происходит по большому ректу Gun.
    
}

//Анимация при нажатии на врага (вызываем метод анимации из shot и передаём ему преобразованные координаты касания в системе NavController)
- (void) startShotAnimatuonWhenTouchHuman:(UITouch *) touch {
    CGPoint pointOfTouch = [touch locationInView:touch.view];
    CGPoint convertedInSuperview = [self convertPoint:pointOfTouch toView:self.superview];
    
    [_shot startAnimationShot:convertedInSuperview];
    
    //начинаем анамацию с задержкой
    [self performSelector:@selector(killHumanAnimation) withObject:nil afterDelay:([_shot durationForMainAnimation] + 0.2f)];
}

- (void) killHumanAnimation {
    //работает на слоях UIView animateWithDuration - не хочет
    [self setBackgroundColor:[UIColor redColor]];
    CABasicAnimation *killEnemy = [CABasicAnimation animationWithKeyPath:@"position.x"];
    [killEnemy setFromValue:[NSNumber numberWithFloat:self.layer.position.x]];
    [killEnemy setToValue:[NSNumber numberWithFloat:50]];
    [killEnemy setDuration:1.f];
    [[self.layer presentationLayer] addAnimation:killEnemy forKey:@"kill"];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CALayer* myLayer = [[CALayer alloc] init];
    myLayer.frame = self.bounds;
    myLayer.backgroundColor = [UIColor greenColor].CGColor;
    [myLayer setContents:(id)[UIImage imageNamed:@"playingJet"].CGImage];
    myLayer.contentsGravity = kCAGravityResizeAspect;
    [self.layer addSublayer:myLayer];
    [myLayer release];

}

- (void)dealloc {
    [super dealloc];
}

@end
