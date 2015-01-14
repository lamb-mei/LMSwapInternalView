//
//  ThirdVC.m
//  LMSwapInternalView
//
//  Created by 羊小咩 on 2014/11/29.
//  Copyright (c) 2014年 羊小咩. All rights reserved.
//

#import "ThirdVC.h"

@interface ThirdVC ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentCtrl;

@end

@implementation ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btn_clickHandle:(id)sender {
    
    NSString *str = [_segmentCtrl selectedSegmentIndex] == 0 ? @"YES" : @"NO" ;
    
    [self.container swapViewControllersByID:@"embedFirst"
                                  SELString:@"setThirdDateToFirst:" withObject:str];
}

@end
