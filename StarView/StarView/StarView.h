//
//  StarView.h
//  ArrangeApp
//
//  Created by alan on 2018/8/20.
//  Copyright © 2018年 xhx. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^StarBlock)(NSInteger index);

@interface StarView : UIView
@property (nonatomic, assign) NSUInteger starCount;
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) CGFloat starWidth;

//必填(传入顺序由上至下)
@property (nonatomic, assign) BOOL isEidt;
@property (nonatomic, assign) NSInteger fillStarCount;

@property (nonatomic, copy) StarBlock starClickBlock;
@end



