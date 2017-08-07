
//
//  CustomLabel.m
//  MenuControllerDemo
//
//  Created by only on 16/11/8.
//  Copyright © 2016年 zhangdan. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UILongPressGestureRecognizer * longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
        [self addGestureRecognizer:longGesture];
    }
    return self;
}
//长按触发的事件
- (void)longAction:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按手势已经触发");
        //一定要调用这个方法
        [self becomeFirstResponder];
        //创建菜单控制器
        UIMenuController * menuvc = [UIMenuController sharedMenuController];
        UIMenuItem * menuItem1 = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(firstItemAction:)];
        UIMenuItem * menuItem2 = [[UIMenuItem alloc]initWithTitle:@"粘贴" action:@selector(secondItemAction:)];
        UIMenuItem * menuItem3 = [[UIMenuItem alloc]initWithTitle:@"删除" action:@selector(threeItemAction:)];
        menuvc.menuItems = @[menuItem1, menuItem2, menuItem3];
        [menuvc setTargetRect:CGRectMake(self.bounds.size.width/2, self.bounds.origin.y-5, 0, 0) inView:self];
        [menuvc setMenuVisible:YES animated:YES];
    }
}
#pragma mark--设置每一个item的点击事件
- (void)firstItemAction:(UIMenuItem *)item
{
    NSLog(@"%s--->%@", __func__, item);
    //通过系统的粘贴板，记录下需要传递的数据
    [UIPasteboard generalPasteboard].string = @"我们好像在见过";
}
- (void)secondItemAction:(UIMenuItem *)item
{
    NSLog(@"%s--->%@", __func__, item);
    //从系统的粘贴板获取复制的数据
    NSString * str = [UIPasteboard generalPasteboard].string;
    if (str) {
        self.text = str;
    }
}
- (void)threeItemAction:(UIMenuItem *)item
{
    NSLog(@"%s--->%@", __func__, item);
    self.text = nil;
}
#pragma mark--必须实现的关键方法
//自己能否成为第一响应者
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
//能否处理Action事件
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(firstItemAction:) || action == @selector(secondItemAction:) ) {
        return YES;
    }
    return [super canPerformAction:action withSender:sender];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
