//
//  SecondVCViewController.m
//  LMSwapInternalView
//
//  Created by 羊小咩 on 2014/11/29.
//  Copyright (c) 2014年 羊小咩. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)goFirst:(id)sender {
    [self.container swapViewControllersByID:@"embedFirst"];
}
- (IBAction)goThird:(id)sender {
    [self.container swapViewControllersByID:@"embedThird"];
}

@end
