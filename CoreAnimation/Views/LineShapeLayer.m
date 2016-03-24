//
//  LineShapeLayer.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/24.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "LineShapeLayer.h"

@implementation LineShapeLayer

- (instancetype)init
{
    if (self = [super init]) {
        
        
        
        
//        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 100, 100)];
//        [path moveToPoint:CGPointMake(20, 20)];
//        [path addArcWithCenter:CGPointMake(50, 50) radius:100 startAngle:M_PI endAngle:M_PI/4 clockwise:YES];
//        [path addLineToPoint:CGPointMake(20, 20)];
//        [path stroke];
        
//        CALayer
        UIBezierPath *path = [self createFontPath];
        self.geometryFlipped = YES;
        self.bounds = CGRectMake(0, 0, 200, 200);
        self.path = path.CGPath;
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = [UIColor redColor].CGColor;
        self.lineDashPattern = @[@6,@3];
        
    }
    return self;
}

- (UIBezierPath *)createFontPath
{
    
    NSString *name = @"STHeitiSC-Light";
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)name, 72, nil);
    CGMutablePathRef letters = CGPathCreateMutable();
    
    //这里设置画线的字体和大小
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge id)font, kCTFontAttributeName,
                           nil];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"张鹏"
                                                                     attributes:attrs];
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    // for each RUN
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        // Get FONT for this run
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        // for each GLYPH in run
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    
    CGPathRelease(letters);
    CFRelease(font);
    
    
    return path;
}

@end
