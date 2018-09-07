//
//  ViewController.m
//  StarView
//
//  Created by mac on 2018/9/7.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "StarView.h"
#define MAS_SHORTHAND_GLOBALS //使用全局宏定义(需要放在.pch文件中)，可以使equalTo- 等效于mas_equalTo
#define MAS_SHORTHAND //使用全局宏定义(需要放在.pch文件中), 可以在调用masonry方法的时候不使用mas_前缀
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    StarView *starView = [[StarView alloc] initWithFrame:CGRectMake(100, 100, 157, 25)];
    starView.isEidt = YES;
    starView.fillStarCount = 5;
    starView.margin = 8;
    starView.starWidth = 25;
    starView.starClickBlock = ^(NSInteger index) {
        NSLog(@"%ld",index); //从零开始
    };
    [self.view addSubview:starView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
