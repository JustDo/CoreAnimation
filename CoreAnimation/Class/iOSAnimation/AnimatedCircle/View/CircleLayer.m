//
//  CircleLayer.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/31.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "CircleLayer.h"

typedef enum MovingPoint {
    POINT_D,// d 点出矩形
    POINT_B,
} MovingPoint;


static CGFloat outsideRectSize = 90;

@interface CircleLayer()

//外接矩形
@property (nonatomic, assign) CGRect outsideRect;

//记录上次的pregress 方便算出滑动方向
@property (nonatomic, assign) CGFloat lastProgress;

@property (nonatomic, assign) MovingPoint movePoint;

@end


@implementation CircleLayer

- (id)init
{
    if (self = [super init]) {
        self.lastProgress = .5;

    }
    return self;
}

- (id)initWithLayer:(CircleLayer *)layer
{
    self = [super initWithLayer:layer];
    if (self) {
        self.progress = layer.progress;
        self.outsideRect = layer.outsideRect;
        self.lastProgress = layer.lastProgress;
    }
    return self;
}


- (void)drawInContext:(CGContextRef)ctx
{
    CGFloat offset = self.outsideRect.size.width / 3.6;
    
    
    CGFloat moveDistance = (self.outsideRect.size.width/6)*fabs(self.progress - 0.5)*2;
    
    
    CGPoint rectCenter = CGPointMake(self.outsideRect.origin.x + self.outsideRect.size.width/2, self.outsideRect.origin.y + self.outsideRect.size.height/2);
    
    
    
    CGPoint pointA = CGPointMake(rectCenter.x, self.outsideRect.origin.y + moveDistance);
    CGPoint pointB = CGPointMake(self.movePoint == POINT_D ? rectCenter.x + self.outsideRect.size.width/2 : rectCenter.x + self.outsideRect.size.width/2 + moveDistance * 2, rectCenter.y);
    CGPoint pointC = CGPointMake(rectCenter.x,rectCenter.y + self.outsideRect.size.height/2 - moveDistance);
     CGPoint pointD = CGPointMake(self.movePoint == POINT_D ? self.outsideRect.origin.x - moveDistance*2 : self.outsideRect.origin.x, rectCenter.y);
    
    
    
    
    CGPoint c1 = CGPointMake(pointA.x + offset, pointA.y);
    CGPoint c2 = CGPointMake(pointB.x, self.movePoint == POINT_D ? pointB.y - offset : pointB.y - offset + moveDistance);
    
    CGPoint c3 = CGPointMake(pointB.x, self.movePoint == POINT_D ? pointB.y + offset : pointB.y + offset - moveDistance);
    CGPoint c4 = CGPointMake(pointC.x + offset, pointC.y);
    
    CGPoint c5 = CGPointMake(pointC.x - offset, pointC.y);
    CGPoint c6 = CGPointMake(pointD.x, self.movePoint == POINT_D ? pointD.y + offset - moveDistance : pointD.y + offset);
    
    CGPoint c7 = CGPointMake(pointD.x, self.movePoint == POINT_D ? pointD.y - offset + moveDistance : pointD.y - offset);
    CGPoint c8 = CGPointMake(pointA.x - offset, pointA.y);
    
    //画外接矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.outsideRect];
    CGContextAddPath(ctx, path.CGPath);
    CGContextSetFillColorWithColor(ctx, [UIColor clearColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGFloat dash[] = {5.0, 5.0};
    CGContextSetLineDash(ctx, 0.0, dash, 2); //1
    CGContextStrokePath(ctx);
    
    
    //内切圆
    UIBezierPath *circlePath  = [UIBezierPath bezierPath];
    [circlePath moveToPoint:pointA];
    [circlePath addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
    [circlePath addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
    [circlePath addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
    [circlePath addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
    [circlePath closePath];
    
    
    CGContextAddPath(ctx, circlePath.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextSetLineDash(ctx, 0, NULL, 0);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    NSArray *points = @[[NSValue valueWithCGPoint:pointA],[NSValue valueWithCGPoint:pointB],[NSValue valueWithCGPoint:pointC],[NSValue valueWithCGPoint:pointD],[NSValue valueWithCGPoint:c1],[NSValue valueWithCGPoint:c2],[NSValue valueWithCGPoint:c3],[NSValue valueWithCGPoint:c4],[NSValue valueWithCGPoint:c5],[NSValue valueWithCGPoint:c6],[NSValue valueWithCGPoint:c7],[NSValue valueWithCGPoint:c8]];
    [self drawPoint:points withContext:ctx];
    
    //连接辅助线
    UIBezierPath *helperline = [UIBezierPath bezierPath];
    [helperline moveToPoint:pointA];
    [helperline addLineToPoint:c1];
    [helperline addLineToPoint:c2];
    [helperline addLineToPoint:pointB];
    [helperline addLineToPoint:c3];
    [helperline addLineToPoint:c4];
    [helperline addLineToPoint:pointC];
    [helperline addLineToPoint:c5];
    [helperline addLineToPoint:c6];
    [helperline addLineToPoint:pointD];
    [helperline addLineToPoint:c7];
    [helperline addLineToPoint:c8];
    [helperline closePath];
    
    CGContextAddPath(ctx, helperline.CGPath);
    
    CGFloat dash2[] = {2.0, 2.0};
    CGContextSetLineDash(ctx, 0.0, dash2, 2);
    CGContextStrokePath(ctx); //给辅助线条填充颜色
}


-(void)drawPoint:(NSArray *)points withContext:(CGContextRef)ctx{
    for (NSValue *pointValue in points) {
        CGPoint point = [pointValue CGPointValue];
        CGContextFillRect(ctx, CGRectMake(point.x - 2,point.y - 2,4,4));
    }
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    //只要外接矩形在左侧，则改变B点；在右边，改变D点
    if (progress <= 0.5) {
        
        self.movePoint = POINT_B;
        NSLog(@"B点动");
        
    }else{
        
        self.movePoint = POINT_D;
        NSLog(@"D点动");
    }
    
    self.lastProgress = progress;
    
    
    CGFloat origin_x = self.position.x - outsideRectSize/2 + (progress - 0.5)*(self.frame.size.width - outsideRectSize);
    CGFloat origin_y = self.position.y - outsideRectSize/2;
    
    self.outsideRect = CGRectMake(origin_x, origin_y, outsideRectSize, outsideRectSize);
    
    [self setNeedsDisplay];
}



@end
