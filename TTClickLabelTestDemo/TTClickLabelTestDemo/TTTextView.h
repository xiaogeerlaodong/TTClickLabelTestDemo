//
//  TTTextView.h
//  TTClickLabelTestDemo
//
//  Created by 董贺超 on 2018/5/31.
//  Copyright © 2018年 donghechao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTextView : UITextView

@property (nonatomic, strong) NSString *clickTitle;
@property (nonatomic, assign) NSStringCompareOptions stringCompareOptions;
@property (nonatomic, copy) void(^didClickStringBlock)(void);

@end
