//
//  OneViewController.m
//  Block的使用
//
//  Created by AY on 2017/10/17.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@property (nonatomic,strong)UITextField *textField;

@property (nonatomic,strong)UIButton *backBtn;


@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	_textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 150, 50)];
	_textField.delegate = self;
	_textField.placeholder = @"input sth";
	_textField.borderStyle = UITextBorderStyleLine;
	[self.view addSubview:_textField];
	
	_backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	_backBtn.frame = CGRectMake(100 , 300, 150, 50);
	[_backBtn setTitle:@"back 传递信息去" forState:UIControlStateNormal];
	[_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
	[_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.view addSubview:_backBtn];
	
	
	self.view.backgroundColor = [UIColor whiteColor];
	
}

// 点击事件 触发值的传递
- (void)backBtnClick
{
	#pragma mark - 使用block 要传递的信息
	self.cb(_textField.text);
	
	[self dismissViewControllerAnimated:YES completion:nil];
	
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
