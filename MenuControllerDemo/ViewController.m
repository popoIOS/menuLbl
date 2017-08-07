//
//  ViewController.m
//  MenuControllerDemo
//
//  Created by only on 16/11/8.
//  Copyright © 2016年 zhangdan. All rights reserved.
//

#import "ViewController.h"
#import "CustomLabel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *MyTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //将自定义的label放在上面
    CustomLabel * myLabel = [[CustomLabel alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
    myLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:myLabel];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
