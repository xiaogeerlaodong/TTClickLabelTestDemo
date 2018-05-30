//
//  TTFeedbackViewController.m
//  TTClickLabelTestDemo
//
//  Created by 董贺超 on 2018/5/30.
//  Copyright © 2018年 donghechao. All rights reserved.
//

#import "TTFeedbackViewController.h"

@interface TTFeedbackViewController ()

@end

@implementation TTFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"feedback";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitle:@"返回>>" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 100, 70, 30);
    button.center = self.view.center;
    button.layer.cornerRadius = 3;
    button.layer.borderColor = [UIColor blueColor].CGColor;
    button.layer.borderWidth = 2;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

- (void)buttonClick:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
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
