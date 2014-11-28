//
//  ViewController.m
//  LMSwapInternalView
//
//  Created by 羊小咩 on 2014/11/28.
//  Copyright (c) 2014年 羊小咩. All rights reserved.
//

#import "ViewController.h"
#import "LMSwapContainerViewController.h"

@interface ViewController ()
{
    NSArray *pArray;
}
@property (nonatomic, weak) LMSwapContainerViewController *containerViewController;


@end


@implementation ViewController




#pragma mark - Initializer
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        pArray = @[@"embedFirst" ,@"embedSecound" ,@"embedThird"];

    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    //取得Container 實體
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
        //設定第一個顯示啥
        self.containerViewController.defaultSID = pArray[0];
        
    }
}

-(IBAction)swapButtonPressed:(id)sender
{
    
//    指定想要切換的 view
//    [self.containerViewController swapViewControllersByID:@"embedThird"];
    NSInteger idx = [pArray indexOfObject:self.containerViewController.currentSegueIdentifier];

    if(idx >= 0){
        idx = idx + 1 < pArray.count ?  idx + 1 :0 ;
        [self.containerViewController swapViewControllersByID:pArray[idx]];
    }

}



@end
