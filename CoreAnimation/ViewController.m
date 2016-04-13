//
//  ViewController.m
//  new
//
//  Created by 张鹏 on 16/2/2.
//  Copyright © 2016年 张鹏. All rights reserved.
//

#import "ViewController.h"

#import <CommonCrypto/CommonDigest.h>

#import "GeneralAnimationController.h"
#import "AdvancedAnimationController.h"
#import "CoreTextViewController.h"
#import "ReplicatorLayerController.h"
#import "TextAnimationViewController.h"
#import "iOSAnimationController.h"

#import "CoreAnimation-swift.h"
@interface ViewController ()

@end

@implementation ViewController
{
   
    NSArray *array;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    array = @[@"GeneralAnimation",@"AdvancedAnimation",@"CoreText",@"CAReplicatorLayer",@"TextAnimation",@"iOS Animation Book",@"CATextLayer"];
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"tableviewcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.textLabel.text = array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
         GeneralAnimationController *general =  [[GeneralAnimationController alloc] init];
        [self.navigationController pushViewController:general animated:YES];
    }else if (indexPath.row == 1)
    {
        AdvancedAnimationController *advanced =  [[AdvancedAnimationController alloc] init];
        [self.navigationController pushViewController:advanced animated:YES];

    }else if (indexPath.row == 2)
    {
        CoreTextViewController *coreText = [[CoreTextViewController alloc]init];
        [self.navigationController pushViewController:coreText animated:YES];
    }else if (indexPath.row == 3)
    {
        ReplicatorLayerController *layer = [[ReplicatorLayerController alloc]init];
        [self.navigationController pushViewController:layer animated:YES];
    }else if (indexPath.row == 4)
    {
        TextAnimationViewController *animation = [[TextAnimationViewController alloc]init];
        [self.navigationController pushViewController:animation animated:YES];
    }else if (indexPath.row == 5)
    {
        iOSAnimationController *animation = [[iOSAnimationController alloc]init];
        [self.navigationController pushViewController:animation animated:YES];
    }else if (indexPath.row == 6)
    {
        
        TextLayerViewController *textLayer = [[TextLayerViewController alloc] init];
        [self.navigationController pushViewController:textLayer animated:YES];
    }
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    

    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
