//
//  CACircleView.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/4/20.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "CACircleView.h"

@implementation CACircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    [[UIColor yellowColor] setFill];
//    [[UIBezierPath  bezierPathWithOvalInRect:self.bounds] fill];
//    
    self.layer.cornerRadius = self.bounds.size.height/2;
    self.layer.masksToBounds = YES;
    
}


@end
