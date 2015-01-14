//
//  OTPFirstVC.m
//  AllPay
//
//  Created by 羊小咩 on 2014/11/28.
//  Copyright (c) 2014年 羊小咩. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)goSecond:(id)sender {
    [self.container swapViewControllersByID:@"embedSecound"];
}
- (IBAction)goThird:(id)sender {
    
    [self.container swapViewControllersByID:@"embedThird"];
}
-(void)setThirdDateToFirst:(NSString *)str
{
    NSLog(@"str %@" ,str  );
    if(str){
        _statusLabel.text = str;
    }
    
}

@end
