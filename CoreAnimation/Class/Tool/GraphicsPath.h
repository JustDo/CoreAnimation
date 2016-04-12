//
//  GraphicsPath.h
//  CoreAnimation
//
//  Created by 张鹏 on 16/4/12.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
@interface GraphicsPath : NSObject

+ (CGPathRef)createFontPathWithText:(NSString *)text;

@end
