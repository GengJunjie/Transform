//
//  TransformAnimation.m
//  TransForm
//
//  Created by gengjunjie on 2018/2/27.
//  Copyright © 2018年 gengjunjie. All rights reserved.
//

#import "TransformAnimation.h"

@implementation TransformAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isDismiss) {
        [self dismissTransition:transitionContext];
    }
    else {
        [self presentTransition:transitionContext];
    }
}

- (void)presentTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toCtrl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    
    toCtrl.view.frame = CGRectMake(rect.size.width, rect.size.height, rect.size.width, rect.size.height);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toCtrl.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toCtrl.view.frame = rect;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)dismissTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toCtrl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromCtrl = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    
    UIView *contentView = [transitionContext containerView];
    [contentView addSubview:toCtrl.view];
    [contentView addSubview:fromCtrl.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         fromCtrl.view.frame = CGRectMake(-rect.size.width, rect.size.height, rect.size.width, rect.size.height);
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         
                     }];
}

@end
