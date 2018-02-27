//
//  ViewController.m
//  TransForm
//
//  Created by gengjunjie on 2018/2/27.
//  Copyright © 2018年 gengjunjie. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "TransformAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.view addSubview:backView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick
{
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    [self presentViewController:twoVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
