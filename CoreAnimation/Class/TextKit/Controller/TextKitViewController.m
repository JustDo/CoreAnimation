//
//  TextKitViewController.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/4/20.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "TextKitViewController.h"
#import "CACircleView.h"

@interface TextKitViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet CACircleView *moveView;



@end

@implementation TextKitViewController
{
    CGPoint _panOffset;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.textView.textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:[NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"lorem" withExtension:@"txt"] usedEncoding:NULL error:NULL]];
    
    self.textView.delegate = self;
    
    
    [self.moveView addGestureRecognizer:[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(circlePan:)]];
    
    [self updateExclusionPaths];
    
    
    self.textView.layoutManager.hyphenationFactor = 1.0;
    
}


- (void)circlePan:(UIPanGestureRecognizer *)pan
{
    // Capute offset in view on begin
    if (pan.state == UIGestureRecognizerStateBegan)
        _panOffset = [pan locationInView: self.moveView];
    
    // Update view location
    CGPoint location = [pan locationInView: self.view];
    CGPoint circleCenter = self.moveView.center;
    
    circleCenter.x = location.x - _panOffset.x + self.moveView.frame.size.width / 2;
    circleCenter.y = location.y - _panOffset.y + self.moveView.frame.size.width / 2;
    self.moveView.center = circleCenter;
    
    // Update exclusion path
    [self updateExclusionPaths];
}

- (void)updateExclusionPaths
{
    CGRect ovalFrame = [self.textView convertRect:self.moveView.bounds fromView:self.moveView];
    
    // Since text container does not know about the inset, we must shift the frame to container coordinates
    ovalFrame.origin.x -= self.textView.textContainerInset.left;
    ovalFrame.origin.y -= self.textView.textContainerInset.top;
    
    // Simply set the exclusion path
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect: ovalFrame];
    self.textView.textContainer.exclusionPaths = @[ovalPath];
    
    // And don't forget clippy
//    [self updateClippy];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


