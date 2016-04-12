//
//  ReplicatorLayerView.h
//  CoreAnimation
//
//  Created by 张鹏 on 16/4/12.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM (NSInteger, CoreAnimationRenderLayer) {  // 评论分类
    RenderLoading = 1,
    RenderPath    = 2,
};


@interface ReplicatorLayerView : UIView
- (instancetype)initWithFrame:(CGRect)frame layer:(CoreAnimationRenderLayer)layer;


@end
