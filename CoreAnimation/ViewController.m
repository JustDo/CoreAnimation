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
@interface ViewController ()

@end

@implementation ViewController
{
   
    NSArray *array;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    array = @[@"GeneralAnimation",@"AdvancedAnimation"];
    
    
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
