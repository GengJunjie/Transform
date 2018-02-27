//
//  TwoViewController.m
//  TransForm
//
//  Created by gengjunjie on 2018/2/27.
//  Copyright © 2018年 gengjunjie. All rights reserved.
//

#import "TwoViewController.h"
#import "TransformAnimation.h"

@interface TwoViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation TwoViewController

- (instancetype)init
{
    if (self = [super init]) {
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    TransformAnimation *transform = [[TransformAnimation alloc] init];
    transform.isDismiss = NO;
    return transform;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    TransformAnimation *transform = [[TransformAnimation alloc] init];
    transform.isDismiss = YES;
    return transform;
}

@end
