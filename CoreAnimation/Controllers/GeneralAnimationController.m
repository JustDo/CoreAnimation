//
//  GeneralAnimationController.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/24.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "GeneralAnimationController.h"
#import "LineShapeLayer.h"
@interface GeneralAnimationController ()
@property (weak, nonatomic) IBOutlet UIView *rectView;


@end

@implementation GeneralAnimationController
{
    BOOL invert;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
        self.title = @"GeneralAnimation";
    
   
}



- (IBAction)tapButton:(id)sender
{

    invert = !invert;
    
    [self createCAAnimation];
    

    [self addLineShape];
    
    
}

- (void)addLineShape
{
    LineShapeLayer *line = [LineShapeLayer layer];
    line.frame = CGRectMake(100, 200, 200, 300);
    [self.view.layer addSublayer:line];
    
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 20;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.autoreverses = YES;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [line addAnimation:animation forKey:@"end"];

}


- (void)createCAAnimation
{
    CGFloat screenWidth =  self.view.bounds.size.width;
    CGFloat screenHeight = self.view.bounds.size.height;
    CGFloat space = 20;
    CFTimeInterval time = 5;
    CGFloat eachSec = (screenWidth-space*2)/time;
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, space, screenHeight/2);
    CGPathAddCurveToPoint(path, NULL, space + eachSec, screenHeight/4, space + eachSec * 2, screenHeight/2, space + eachSec * 3, screenHeight*3/4);
    CGPathAddQuadCurveToPoint(path, NULL, 300, 400, 200, 100);
    
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = path;
    
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.fromValue = @(100);
    rotate.toValue = @(88);
    
    
    CABasicAnimation *color = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    color.fromValue = (id)[UIColor purpleColor].CGColor;
    color.toValue = (id)[UIColor redColor].CGColor;
    
    
    
    CABasicAnimation *cornerRadius = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadius.fromValue = @1;
    cornerRadius.toValue = @(_rectView.bounds.size.width/2);
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @1;
    scale.toValue = @3;
    
    
    CABasicAnimation *border = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    border.fromValue = @0;
    border.toValue = @2;
    
    
    
    CABasicAnimation *borderColor = [CABasicAnimation animationWithKeyPath:@"borderColor"];//根据可动画属性来做 Animatable
    borderColor.fromValue = (id)[UIColor brownColor].CGColor;;
    borderColor.toValue = (id)[UIColor yellowColor].CGColor;;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[keyAnimation,rotate,color,cornerRadius,scale,border,borderColor];
    group.duration = time;
    group.speed = 1.5;
    group.timingFunction = [CAMediaTimingFunction functionWithControlPoints:.3 :.9 :.2 :.1];//时间函数,匀速,渐缓等
    group.removedOnCompletion = NO;//设置使view不会回到最初的状态
    group.fillMode = kCAFillModeBoth;
    group.autoreverses = YES;
    //    group.repeatCount = 3;
    [_rectView.layer addAnimation:group forKey:@"group"];
    
}

//矩阵变换
- (void)transform3DAnimation
{
    CATransform3D rotate = CATransform3DMakeRotation(M_PI, 0, 0, -1);
    CATransform3D scale = CATransform3DMakeScale(2, 2, 2);
    CATransform3D position = CATransform3DMakeTranslation(100, 200, 0);
    
    CATransform3D combine = CATransform3DConcat(rotate, scale);
    CATransform3D combine2 = CATransform3DConcat(combine, position);
    
    CATransform3D invertTransform = CATransform3DInvert(combine2);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = invert ? [NSValue valueWithCATransform3D:combine2] : [NSValue valueWithCATransform3D:invertTransform];
    animation.duration = 2;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [_rectView.layer addAnimation:animation forKey:@"3DAnimation"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
