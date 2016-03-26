//
//  StartView.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/25.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "StartView.h"

@interface StartView ()

@property(nonatomic,strong) CAShapeLayer *progressLayer;

//progressLayer
@end


@implementation StartView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CGFloat radius = CGRectGetWidth(self.bounds)/2.0;
        CGPoint center = CGPointMake(radius, radius);
        
        CGFloat startAngle = -M_PI_2;
        CGFloat endAngle = M_PI_2*3.0;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.lineWidth = 2;
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.strokeColor = [UIColor yellowColor].CGColor;
        _progressLayer.path = path.CGPath;
        [self.layer addSublayer:_progressLayer];
    }
    return self;
}


- (void)basicAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 2;
    animation.fillMode = kCAFillModeBoth;
    [_progressLayer addAnimation:animation forKey:@"end"];
}

@end
