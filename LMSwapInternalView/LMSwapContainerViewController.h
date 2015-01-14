//
//  OTPBaseVC.h
//  AllPay
//
//  Created by 羊小咩 on 2014/11/28.
//  Copyright (c) 2014年 羊小咩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMSwapContainerViewController : UIViewController

//當前的 SID
@property (strong, nonatomic ,readonly) NSString *currentSegueIdentifier;
//預設的sid
@property (nonatomic) NSString *defaultSID;

- (void)swapViewControllersByID:(NSString *)sid;
- (void)swapViewControllersByID:(NSString *)segueIdentifier SELString:(NSString*)sel_string withObject:(id)info;
@end
