//
//  DownLoadButtonController.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/4/1.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "DownLoadButtonController.h"
#import "DownLoadButton.h"
@interface DownLoadButtonController ()
@property (weak, nonatomic) IBOutlet DownLoadButton *loadButton;

@end

@implementation DownLoadButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.loadButton.progressHeight = 30;
    self.loadButton.progressWidth = 200;
    
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
