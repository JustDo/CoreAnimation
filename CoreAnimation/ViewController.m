//
//  ViewController.m
//  new
//
//  Created by 张鹏 on 16/2/2.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "ViewController.h"

#import <CommonCrypto/CommonDigest.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewRotate;

@property (weak, nonatomic) IBOutlet UIView *rectView;

@end

@implementation ViewController
{
    NSString *diskCachePath;
    NSFileManager *_fileManager;
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //1.创建核心动画
    //         CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //         //平移
    //         keyAnima.keyPath=@"position";
    //         //1.1告诉系统要执行什么动画
    //         NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    //         NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    //         NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    //         NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    //         NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    //         keyAnima.values=@[value1,value2,value3,value4,value5];
    //         //1.2设置动画执行完毕后，不删除动画
    //         keyAnima.removedOnCompletion=NO;
    //         //1.3设置保存动画的最新状态
    //         keyAnima.fillMode=kCAFillModeForwards;
    //         //1.4设置动画执行的时间
    //         keyAnima.duration=4.0;
    //         //1.5设置动画的节奏
    //         keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //
    //         //设置代理，开始—结束
    //         keyAnima.delegate=self;
    //         //2.添加核心动画
    //         [lineView.layer addAnimation:keyAnima forKey:nil];
    
    //    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //         //平移
    //         keyAnima.keyPath=@"position";
    //         //1.1告诉系统要执行什么动画
    //         //创建一条路径
    //         CGMutablePathRef path=CGPathCreateMutable();
    //         //设置一个圆的路径
    //         CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
    //         keyAnima.path=path;
    //
    //         //有create就一定要有release
    //         CGPathRelease(path);
    //         //1.2设置动画执行完毕后，不删除动画
    //         keyAnima.removedOnCompletion=NO;
    //         //1.3设置保存动画的最新状态
    //         keyAnima.fillMode=kCAFillModeForwards;
    //         //1.4设置动画执行的时间
    //         keyAnima.duration=5.0;
    //         //1.5设置动画的节奏
    //         keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //
    //         //2.添加核心动画
    //         [lineView.layer addAnimation:keyAnima forKey:@"wendingding"];
    
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    //    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    //    rotateAnimation.toValue = [NSNumber numberWithFloat: M_PI];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.repeatCount = MAXFLOAT;
    rotateAnimation.duration = 2;
    rotateAnimation.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionScale];
//    [lineView.layer addAnimation:rotateAnimation forKey:@"rotation"];
    
    //    CABasicAnimation
}


- (IBAction)tapButton:(id)sender
{

    
    
    //    UIBezierPath *path = [UIBezierPath bezierPath];
    //    [path moveToPoint:CGPointMake(20, 350)];
    //    [path addCurveToPoint:CGPointMake(300, 350) controlPoint1:CGPointMake(160, 0) controlPoint2:CGPointMake(160, 700)];
    //    //    path.lineCapStyle = kCGLineCapSquare;
    //    //    path.lineJoinStyle = kCGLineJoinBevel;
    //
    //    //    [path addArcWithCenter:CGPointMake(20, 350) radius:50 startAngle:M_PI endAngle:M_PI_2/4 clockwise:YES];
    //    path.lineWidth = 3;
    //
    //    [[UIColor blackColor] set];
    //    [path stroke];
    
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
