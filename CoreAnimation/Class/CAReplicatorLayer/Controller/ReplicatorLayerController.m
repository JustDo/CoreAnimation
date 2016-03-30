//
//  ReplicatorLayerController.m
//  CoreAnimation
//
//  Created by 张鹏 on 16/3/30.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "ReplicatorLayerController.h"
#import "LayerAnimation.h"
#import "AnimatedMaskLabel.h"
@interface ReplicatorLayerController ()

@end

@implementation ReplicatorLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    


    
    CALayer *layer = [LayerAnimation replicatorLayer_Wave];
    layer.frame = CGRectMake(100, 100, 50, 50);
    [self.view.layer addSublayer:layer];
    
    
    
    AnimatedMaskLabel *label = [[AnimatedMaskLabel alloc]initWithFrame:CGRectMake(20, 200, 300, 100)];
    [self.view addSubview:label];
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
