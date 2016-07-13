//
//  ViewController.m
//  自定义UIButton
//
//  Created by 谷士雄 on 16/7/12.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"
#import "ATButton.h"

@interface ViewController ()
@property (nonatomic, weak) ATButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ATButton *btn = [[ATButton alloc] init];
//    [btn setBackgroundColor:[UIColor greenColor]];
//    [btn setFrame:CGRectMake(100, 100, 100, 100)];
//    [btn setTitle:@"按钮" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"mainCellCaiClick"] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    

    
//    UIButton *btn = [[UIButton alloc] init];
//    [btn setBackgroundColor:[UIColor greenColor]];
//    [btn setFrame:CGRectMake(100, 100, 100, 100)];
//    [btn setTitle:@"按钮" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"mainCellCaiClick"] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.frame.size.width * 0.5, 0, 0);
//    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.frame.size.width + (btn.frame.size.width * 0.5 - btn.titleLabel.frame.size.width), 0, 0);
//    [self.view addSubview:btn];
    
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundColor:[UIColor greenColor]];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"mainCellCaiClick"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.imageEdgeInsets = UIEdgeInsetsMake(-(btn.imageView.frame.size.height),btn.frame.size.width * 0.5 - btn.imageView.frame.size.width * 0.5, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.titleLabel.frame.size.width * 0.5, -(btn.titleLabel.frame.size.height), 0);
    [self.view addSubview:btn];
    
}
- (void)btnClick:(ATButton *)btn {
    NSLog(@"%@",btn.titleLabel.text);
}
@end
