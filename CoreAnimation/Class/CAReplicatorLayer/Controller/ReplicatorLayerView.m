//
//  ReplicatorLayerView.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/4/12.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "ReplicatorLayerView.h"

@implementation ReplicatorLayerView
{
    CAReplicatorLayer *rep;
    CALayer *dot;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        dot = [CALayer layer];
        dot.bounds = CGRectMake(0, 0, 14, 14);
        dot.position = CGPointMake(self.bounds.size.width/2, 40);
        dot.backgroundColor = [UIColor colorWithWhite:.8 alpha:1].CGColor;
        dot.borderColor = [UIColor colorWithWhite:1 alpha:1].CGColor;
        dot.borderWidth = 1;
        dot.cornerRadius = 2;

        rep = [self replicator];
        [self.layer addSublayer:rep];
        [rep addSublayer:dot];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRotation)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (CAReplicatorLayer *)replicator
{
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    layer.instanceCount = 15;
    CGFloat angle = (2*M_PI)/(15);
    layer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    return layer;
}


- (void)tapRotation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @1;
    animation.toValue = @(.1);
    animation.duration = 1.5;
    animation.repeatCount = 100;
    rep.instanceDelay = 1.5/15;
    dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    [dot addAnimation:animation forKey:@"scale"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
