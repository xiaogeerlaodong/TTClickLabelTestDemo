//
//  TTTextView.m
//  TTClickLabelTestDemo
//
//  Created by 董贺超 on 2018/5/31.
//  Copyright © 2018年 donghechao. All rights reserved.
//

#import "TTTextView.h"

@implementation TTTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAttributes];
    }
    return self;
}

- (void)addAttributes
{
    self.editable = NO;
    self.selectable = NO;
    self.showsVerticalScrollIndicator = NO;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleGestureRecognizer:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)handleGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    UITextView *textView = (UITextView *)gestureRecognizer.view;
    NSLayoutManager *layoutManager = textView.layoutManager;
    CGPoint location = [gestureRecognizer locationInView:textView];
    location.x -= textView.textContainerInset.left;
    location.y -= textView.textContainerInset.top;
    NSUInteger characterIndex;
    characterIndex = [layoutManager characterIndexForPoint:location
                                           inTextContainer:textView.textContainer
                  fractionOfDistanceBetweenInsertionPoints:NULL];

    NSRange range = [textView.attributedText.string rangeOfString:self.clickTitle options:self.stringCompareOptions];
    if (range.length) {
        if (characterIndex >= range.location && characterIndex < range.location + range.length) {
            if (self.didClickStringBlock) {
                self.didClickStringBlock();
            }
        }
    }
}

@end
