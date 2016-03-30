//
//  AnimatedMaskLabel.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/30.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "AnimatedMaskLabel.h"

@implementation AnimatedMaskLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        

            UILabel* testLabel = [[UILabel alloc] init];
            testLabel.text = @"你是我的小呀小苹果";
            testLabel.font = [UIFont systemFontOfSize:23];
            [testLabel sizeToFit];
            
            [self addSubview:testLabel];
            testLabel.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.7);
            
            // 创建渐变层
            CAGradientLayer* gradientLayer = [CAGradientLayer layer];
            gradientLayer.frame = testLabel.frame;
            gradientLayer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor whiteColor].CGColor,(id)[UIColor redColor].CGColor];
            gradientLayer.locations = @[
                                    @(0),
                                    @(0.50),
                                    @(1)
                                    ];
            gradientLayer.startPoint = CGPointMake(0, .2);
            gradientLayer.endPoint = CGPointMake(1, .5);
            [self.layer addSublayer:gradientLayer];
            
            gradientLayer.mask = testLabel.layer;
            testLabel.frame = gradientLayer.bounds;
        
        

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
        animation.fromValue = @[@(0),@(.1),@(.2)];
        animation.toValue = @[@(1),@(1),@(1.0)];
        animation.duration = 2;
        animation.repeatCount = 5;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];//[CAMediaTimingFunction functionWithControlPoints:.9 :.7 :.2 :.1];
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [gradientLayer addAnimation:animation forKey:@"locations"];
        


    }
    return self;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
