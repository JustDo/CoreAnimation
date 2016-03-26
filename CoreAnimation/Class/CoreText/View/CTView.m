//
//  CTView.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/25.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "CTView.h"

@implementation CTView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(ref, CGAffineTransformIdentity);
    CGContextTranslateCTM(ref, 0, self.bounds.size.height);
    CGContextScaleCTM(ref, 1, -1);
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    

    
    NSString *str = @"This is a test of characterAttribute. 中文字符";
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:str];
    [attString beginEditing];
    
    long number = 1;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &number);
//    [attString addAttribute:(id)kCTForegroundColorFromContextAttributeName value:(__bridge id)num range:NSMakeRange(0, 4)];
    
    
    //字体属性
    CTFontRef font = CTFontCreateWithName(CFSTR("Georgia"), 20, NULL);
    [attString addAttribute:(id)kCTFontAttributeName value:(__bridge id)font range:NSMakeRange(0, str.length)];
    
    //字体间隔
    long space = 10;
    CFNumberRef spaceNum = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &space);
//    [attString addAttribute:(id)kCTKernAttributeName value:(__bridge id)spaceNum range:NSMakeRange(10, 4)];
    
    
    [attString addAttribute:(id)kCTForegroundColorAttributeName value:(id)[UIColor redColor].CGColor range:NSMakeRange(0, 9)];
    
    
    [attString addAttribute:(id)kCTForegroundColorFromContextAttributeName value:(id)kCFBooleanTrue range:NSMakeRange(5, 10)];
    
    //空心字
    long empty = 1;
    CFNumberRef emptyNum = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &empty);
    [attString addAttribute:(id)kCTStrokeWidthAttributeName value:(__bridge id)emptyNum range:NSMakeRange(0, str.length)];
    [attString addAttribute:(id)kCTStrokeColorAttributeName value:(__bridge id)[UIColor blueColor].CGColor range:NSMakeRange(0, str.length)];
    
    //斜体
    CTFontRef italicFont = CTFontCreateWithName((CFStringRef)[UIFont italicSystemFontOfSize:40].fontName, 40, NULL);
    [attString addAttribute:(id)kCTFontAttributeName value:(__bridge id)italicFont range:NSMakeRange(6, 1)];

    
    [attString addAttribute:(id)kCTUnderlineStyleAttributeName value:(id)[NSNumber numberWithInt:kCTUnderlineStyleSingle] range:NSMakeRange(0, 4)];
    [attString addAttribute:(id)kCTUnderlineColorAttributeName value:(__bridge id)[UIColor yellowColor].CGColor range:NSMakeRange(0, 4)];
    
    [attString endEditing];
    

    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attString.length), path, NULL);

    
    
    CFArrayRef lines = CTFrameGetLines(frame);
    CFIndex lineNumber = CFArrayGetCount(lines);
    CGPoint lineOrigins[lineNumber];
    CTFrameGetLineOrigins(frame,CFRangeMake(0,lineNumber), lineOrigins);
    
    for(CFIndex lineIndex = 0;lineIndex < lineNumber;lineIndex++){
        
        CGPoint lineOrigin = lineOrigins[lineIndex];
        CTLineRef line = CFArrayGetValueAtIndex(lines,lineIndex);
        CGContextSetTextPosition(ref,lineOrigin.x,lineOrigin.y);
        
        CTLineDraw(line,ref);
        
    }
    
    
//    CTFrameDraw(frame, ref);

    CFRelease(framesetter);
    CFRelease(path);
    CFRelease(frame);
    
    
    
}


@end
