//
//  CircleView.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/31.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

+ (Class)layerClass
{
    return [CircleLayer class];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _circleLayer = [CircleLayer layer];
        _circleLayer.frame = self.bounds;
        _circleLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:_circleLayer];
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
