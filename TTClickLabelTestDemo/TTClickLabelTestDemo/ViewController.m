//
//  ViewController.m
//  TTClickLabelTestDemo
//
//  Created by 董贺超 on 2018/5/30.
//  Copyright © 2018年 donghechao. All rights reserved.
//

#import "ViewController.h"
#import "TTTextView.h"
#import "TTFeedbackViewController.h"

@interface ViewController ()

@property (nonatomic, strong) TTTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"ClickLabel";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTTTextView];
    
    
}

- (void)createTTTextView
{
    self.textView = [[TTTextView alloc] init];
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.scrollEnabled = NO;
//    self.textView.textContainerInset = UIEdgeInsetsMake(6, 0, 0, 0);
    [self.view addSubview:self.textView];
    
    NSString *clickString = @"反馈";
    
    NSMutableString *displayString = [[NSMutableString alloc] initWithString:@"欢迎使用探探, 在使用过程中有疑问请"];

    self.textView.clickTitle = clickString;

    [displayString appendString:clickString];
    NSMutableAttributedString *contentString = [[NSMutableAttributedString alloc] initWithString:displayString];
    NSMutableParagraphStyle *commonParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    commonParagraphStyle.lineSpacing = 3;
    [contentString addAttribute:NSParagraphStyleAttributeName value:commonParagraphStyle range:NSMakeRange(0, contentString.string.length)];
    [contentString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, contentString.string.length)];
    [contentString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, contentString.string.length)];
    NSRange clickkange = [contentString.string rangeOfString:clickString];
    if (clickkange.length > 0) {
        [contentString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:clickkange];
    }
    
    CGSize size = [contentString boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    self.textView.attributedText = [contentString copy];
    self.textView.frame = CGRectMake(self.view.frame.size.width * 0.5 - size.width * 0.5 - 10, 150, size.width + 10, size.height + 20);
    __weak __typeof(self)weakSelf = self;
    self.textView.didClickStringBlock = ^ {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        TTFeedbackViewController *feedbackVC = [[TTFeedbackViewController alloc] init];
        [strongSelf.navigationController pushViewController:feedbackVC animated:YES];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
