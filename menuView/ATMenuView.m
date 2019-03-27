//
//  ATMenuView.m
//
//
//  Created by mac on 2019/3/27.
//  Copyright © 2019 AT. All rights reserved.
//

#import "ATMenuView.h"
#import "ATButton.h"

@interface ATMenuView ()
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, weak) ATButton *menuBtn;
@property (nonatomic, assign) int selectedIndex;
@end

@implementation ATMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    WeakSelf;
    
    UIView *menusView = [[UIView alloc] init];
    menusView.frame = CGRectMake(0,0,96,32);
    menusView.layer.borderWidth = 0.5;
    menusView.layer.borderColor = [UIColor colorWithRed:238/255.0 green:239/255.0 blue:240/255.0 alpha:1.0].CGColor;
    menusView.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    menusView.layer.cornerRadius = 16;
    [self addSubview:menusView];
    
    ATButton *menuBtn = [[ATButton alloc] initWithFrame:CGRectMake(12, 6, 84, 20)];
    menuBtn.buttonStyle = ATButtonStyleLeftTitleRightImage;
    menuBtn.padding = 8;
    menuBtn.imageViewWidth = 9;
    menuBtn.imageViewHeight = 5;
    menuBtn.titleColor = [UIColor blackColor];
    menuBtn.titleFontSize = 14;
    [menuBtn setImage:[UIImage imageNamed:@"筛选按钮下"]];
    menuBtn.tap = ^{
        [weakSelf menusTap];
    };
    [menusView addSubview:menuBtn];
    self.menuBtn = menuBtn;
    
}

- (void)setMenus:(NSMutableArray *)menus {
    _menus = menus;
    [self.menuBtn setTitle:menus.count > 0 ? menus[0] : @""];
}

- (void)menusTap {
    WeakSelf;
    
    UIView *maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    maskView.userInteractionEnabled = YES;
    UITapGestureRecognizer *maskViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(maskViewTap:)];
    [maskView addGestureRecognizer:maskViewTap];
    [[UIApplication sharedApplication].keyWindow addSubview:maskView];
    self.maskView = maskView;
    
    UIView *menusView = [[UIView alloc] init];
    menusView.frame = CGRectMake(17,17 + (iphoneX ? 88 : 64),96,30 * self.menus.count);
    menusView.layer.borderWidth = 0.5;
    menusView.layer.borderColor = [UIColor colorWithRed:238/255.0 green:239/255.0 blue:240/255.0 alpha:1.0].CGColor;
    menusView.layer.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0].CGColor;
    menusView.layer.cornerRadius = 16;
    [maskView addSubview:menusView];
    
    for (int i = 0; i < self.menus.count; i++) {
        ATButton *menuBtn = [[ATButton alloc] initWithFrame:CGRectMake(12, i * 30, 72, 30)];
        menuBtn.buttonStyle = ATButtonStyleLeftTitleRightImage;
        menuBtn.padding = 8;
        menuBtn.imageViewWidth = 9;
        menuBtn.imageViewHeight = 5;
        menuBtn.titleColor = [UIColor blackColor];
        if (self.selectedIndex > 0 && self.selectedIndex == i) {
            menuBtn.titleColor = [UIColor colorWithHex:@"#6631F2"];
        }
        menuBtn.titleFontSize = 14;
        [menuBtn setImage:[UIImage imageNamed:i == 0 ? @"筛选按钮上" : @""]];
        
        [menuBtn setTitle:self.menus[i]];
        menuBtn.tap = ^{
            NSLog(@"%d",i);
            weakSelf.selectedIndex = i;
            [self.menuBtn setTitle:self.menus[i]];
            [weakSelf selectItem];
        };
        [menusView addSubview:menuBtn];
    }
}
- (void)selectItem {
    [self.maskView removeFromSuperview];
}

- (void)maskViewTap:(UITapGestureRecognizer *)tap {
    [tap.view removeFromSuperview];
}
@end
