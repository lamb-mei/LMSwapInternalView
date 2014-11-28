//  羊小咩 on 2014/11/28.
//  可以在同個View Controller 切換 view
//  參考這位 Michael Luton 功能
//  修改為可以by Segue ID 切換 , 也可以於內部切換
//  Michael Luton
//  blog post http://sandmoose.com/post/35714028270/storyboards-with-custom-container-view-controllers
//  GitHub
//  https://github.com/mluton/EmbeddedSwapping

//  原始 Header
//  ContainerViewController.m
//  EmbeddedSwapping
//
//  Created by Michael Luton on 11/13/12.
//  Copyright (c) 2012 Sandmoose Software. All rights reserved.
//  Heavily inspired by http://orderoo.wordpress.com/2012/02/23/container-view-controllers-in-the-storyboard/
//



#import "LMSwapContainerViewController.h"
#import "LMSwapChildViewController.h"


@interface LMSwapContainerViewController ()


@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation LMSwapContainerViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.transitionInProgress = NO;
    
    //設定預設 segueIdentifier
    if(self.defaultSID){
        [self performSegueWithIdentifier:self.defaultSID sender:nil];
    }

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    LMSwapChildViewController *child = segue.destinationViewController;
    child.container = self;
    
    _currentSegueIdentifier = segue.identifier;

    //必須要有兩個 ViewControllers 才能做動畫效果
    if (self.childViewControllers.count > 0) {
        //切換畫面
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
    //如果是第一次載入
    //在這邊初始化
    //這裏不做 swap
    else{
        [self addChildViewController:segue.destinationViewController];
        UIView* destView = ((UIViewController *)segue.destinationViewController).view;
        destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:destView];
        [segue.destinationViewController didMoveToParentViewController:self];
    }

    
    
    return;
    

}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
//    NSLog(@"%s", __PRETTY_FUNCTION__);

    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];

    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}



- (void)swapViewControllersByID:(NSString *)segueIdentifier
{
//    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if (self.transitionInProgress) {
        return;
    }
    //目標跟目前的相同就不執行
    if(self.currentSegueIdentifier == segueIdentifier){
        return;
    }

    self.transitionInProgress = YES;
    
    //run time 發生錯誤大部分是沒有設定好 Segue ID
    [self performSegueWithIdentifier:segueIdentifier sender:nil];
}



@end
