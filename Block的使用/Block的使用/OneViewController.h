//
//  OneViewController.h
//  Block的使用
//
//  Created by AY on 2017/10/17.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import <UIKit/UIKit.h>
/**

	定义block
*/
typedef void(^OneCallBackBlock) (NSString *info);

@interface OneViewController : UIViewController

/**

	持有block
*/
@property (nonatomic,copy)OneCallBackBlock cb;


@end
