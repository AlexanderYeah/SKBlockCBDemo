//
//  ViewController.m
//  Block的使用
//
//  Created by AY on 2017/10/17.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
@interface ViewController ()
// 显示回调的信息
@property (nonatomic,strong)UILabel * showBackInfoLbl;
// 按钮
@property (nonatomic,strong)UIButton *getInfoBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	_showBackInfoLbl = [[UILabel alloc]init];
	_showBackInfoLbl.frame = CGRectMake(100 , 140, 150, 50);
	_showBackInfoLbl.textColor = [UIColor blackColor];
	_showBackInfoLbl.text = @"待显示";
	_showBackInfoLbl.font = [UIFont boldSystemFontOfSize:12.0f];
	[self.view addSubview:_showBackInfoLbl];
	
	_getInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	_getInfoBtn.frame = CGRectMake(100 , 300, 150, 50);
	[_getInfoBtn setTitle:@"get 信息去" forState:UIControlStateNormal];
	[_getInfoBtn addTarget:self action:@selector(getInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
	_getInfoBtn.layer.borderWidth = 1;
	_getInfoBtn.layer.borderColor = [UIColor redColor].CGColor;
	[_getInfoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	
	[self.view addSubview:_getInfoBtn];
}


#pragma mark - 1
- (void)getInfoBtnClick
{

	
	
	#pragma mark  - 循环引用 此处 是 self 创建 OneVC 并且引用了其block，
	// 而在其block中，又使用到了self，所以会造成循环引用，所以先weak
	
	 OneViewController *oneVC = [[OneViewController alloc]init];
	__weak typeof(self) weakSelf = self;
	oneVC.cb = ^(NSString *info) {
		weakSelf.showBackInfoLbl.text = info;
	};
	
	[self presentViewController:oneVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
