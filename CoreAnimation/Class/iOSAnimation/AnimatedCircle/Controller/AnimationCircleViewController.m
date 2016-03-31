//
//  AnimationCircleViewController.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/31.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "AnimationCircleViewController.h"
#import "CircleView.h"
@interface AnimationCircleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@property (strong,nonatomic) CircleView *cv;
@end

@implementation AnimationCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [_slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    self.cv = [[CircleView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 320/2, self.view.frame.size.height/2 - 320/2, 320, 320)];
    [self.view addSubview:self.cv];

    self.cv.circleLayer.progress = _slider.value;
}

- (void)valueChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    _label.text = [NSString stringWithFormat:@"%.4f",slider.value];
    self.cv.circleLayer.progress = slider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
