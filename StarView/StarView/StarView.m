//
//  StarView.m
//  ArrangeApp
//
//  Created by alan on 2018/8/20.
//  Copyright © 2018年 xhx. All rights reserved.
//

#import "StarView.h"
#define MAS_SHORTHAND_GLOBALS //使用全局宏定义(需要放在.pch文件中)，可以使equalTo- 等效于mas_equalTo
#define MAS_SHORTHAND //使用全局宏定义(需要放在.pch文件中), 可以在调用masonry方法的时候不使用mas_前缀
#import "Masonry.h"

@interface StarView ()
@property (nonatomic, strong) NSMutableArray *btns;
@end

@implementation StarView
- (void)setFillStarCount:(NSInteger)fillStarCount {
    _fillStarCount = fillStarCount;
    for (UIButton *btn in _btns) {
        if (btn.tag < fillStarCount) {
            [btn setImage:[UIImage imageNamed:@"star_fill"] forState:UIControlStateNormal];
        } else {
            if (!_isEidt) {
                [btn setHidden:YES];
            } else {
                [btn setImage:[UIImage imageNamed:@"star_empty"] forState:UIControlStateNormal];
            }
        }
    }
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _btns = [NSMutableArray array];
        [self setupSubViews];
    }
    return self;
}
- (void)setupSubViews {
    NSUInteger starCount = 5;
    CGFloat margin = 5;
    CGFloat starWidth = 19;
    if (self.starCount == 0) {
        self.starCount = starCount;
    }
    if (self.margin == 0) {
        self.margin = margin;
    }
    if (self.starWidth == 0) {
        self.starWidth = starWidth;
    }
    
    for (int i = 0; i < self.starCount; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.adjustsImageWhenHighlighted = NO;
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:@"star_empty"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(starClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        CGFloat leftOffset = i * (self.starWidth + self.margin);
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(leftOffset);
            make.width.equalTo(@(self.starWidth));
            make.height.equalTo(@(self.starWidth));
        }];
        [_btns addObject:btn];
    }
}
- (void)starClick:(UIButton *)btn {
    if (_isEidt) {
        self.fillStarCount = btn.tag + 1;
    }
    if (self.starClickBlock && _isEidt) {
        self.starClickBlock(btn.tag);
    }
}
@end
