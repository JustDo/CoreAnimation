//
//  ReplicatorLayerView.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/4/12.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "ReplicatorLayerView.h"
#import "GraphicsPath.h"
@implementation ReplicatorLayerView
{
    CAReplicatorLayer *rep;
    CALayer *dot;
    
    CoreAnimationRenderLayer animationType;
}
- (instancetype)initWithFrame:(CGRect)frame layer:(CoreAnimationRenderLayer)layer
{
    if (self = [super initWithFrame:frame]) {
        
        animationType = layer;
        
        if (layer == RenderLoading) {
            dot = [self loadingDot];
            rep = [self loadingReplicator];
        }else{
            dot = [self pathDot];
            rep = [self pathReplicator];
        }
        
        [self.layer addSublayer:rep];
        [rep addSublayer:dot];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRotation)];
        [self addGestureRecognizer:tap];
    }
    return self;
}


// loading
- (CAReplicatorLayer *)loadingReplicator
{
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    layer.instanceCount = 15;
    layer.instanceDelay = 1.5/15;
    CGFloat angle = (2*M_PI)/(15);
    layer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    return layer;
}

- (CALayer *)loadingDot
{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 14, 14);
    layer.position = CGPointMake(self.bounds.size.width/2, 40);
    layer.backgroundColor = [UIColor colorWithWhite:.8 alpha:1].CGColor;
    layer.borderColor = [UIColor colorWithWhite:1 alpha:1].CGColor;
    layer.borderWidth = 1;
    layer.cornerRadius = 2;
    return layer;
}

- (void)tapRotation
{
    if (animationType == RenderLoading) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.fromValue = @1;
        animation.toValue = @(.1);
        animation.duration = 1.5;
        animation.repeatCount = 100;
        
        dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
        [dot addAnimation:animation forKey:@"scale"];
    }else{
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.path = [self animationPath];
        animation.duration = 4;
        animation.repeatCount = 10;
        [dot addAnimation:animation forKey:nil];
    }
    
}


// 字体描边
- (CGPathRef)animationPath
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(31.5, 71.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5, 23.5)];
    [bezierPath addCurveToPoint:CGPointMake(58.5, 38.5) controlPoint1:CGPointMake(31.5, 23.5) controlPoint2:CGPointMake(62.46, 18.69)];
    [bezierPath addCurveToPoint:CGPointMake(53.5, 45.5) controlPoint1:CGPointMake(57.5, 43.5) controlPoint2:CGPointMake(53.5, 45.5)];

    [bezierPath addLineToPoint:CGPointMake(43.5, 48.5)];
    
    [bezierPath addLineToPoint:CGPointMake(43.5, 48.5)];
    [bezierPath addLineToPoint:CGPointMake(53.5, 66.5)];
    [bezierPath addLineToPoint:CGPointMake(62.5, 51.5)];
    [bezierPath addLineToPoint:CGPointMake(70.5, 66.5)];
    [bezierPath addLineToPoint:CGPointMake(86.5, 23.5)];
    [bezierPath addLineToPoint:CGPointMake(86.5, 78.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5, 78.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5, 71.5)];

    [bezierPath closePath];
    
   CGAffineTransform t = CGAffineTransformMakeScale(3.0, 3.0);

    return CGPathCreateCopyByTransformingPath(bezierPath.CGPath, &t);
}


- (CAReplicatorLayer *)pathReplicator
{
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
//    layer.bounds = self.bounds;
//    layer.position = self.center;
    layer.backgroundColor = [UIColor colorWithWhite:0 alpha:.75].CGColor;
    layer.instanceCount = 20;
    layer.instanceDelay = .1;
    layer.instanceColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor; //UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0).CGColor
    layer.instanceGreenOffset = -0.03;
//    CGFloat angle = (2*M_PI)/(15);
//    layer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    return layer;
}

- (CALayer *)pathDot
{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 10, 10);
//    layer.position = CGPointMake(self.bounds.size.width/2, 40);
    layer.backgroundColor = [UIColor colorWithWhite:.8 alpha:1].CGColor;
    layer.borderColor = [UIColor colorWithWhite:1 alpha:1].CGColor;
    layer.borderWidth = 1;
    layer.cornerRadius = 5;
    layer.shouldRasterize = YES;
    layer.rasterizationScale = [UIScreen mainScreen].scale;
    return layer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
