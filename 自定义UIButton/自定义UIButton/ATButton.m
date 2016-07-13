//
//  ATButton.m
//  自定义UIButton
//
//  Created by 谷士雄 on 16/7/12.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ATButton.h"

@implementation ATButton

////更改上下方向图片和文字的位置
//- (void)layoutSubviews{
//    [super layoutSubviews];
//    
//    CGRect imageRect = self.imageView.frame;
//    imageRect.origin.x = self.frame.size.width * 0.5 - imageRect.size.width * 0.5;
//    imageRect.origin.y = self.frame.size.height * 0.5 - imageRect.size.height;
//    
//    CGRect titleRect = self.titleLabel.frame;
//    titleRect.origin.x = self.frame.size.width * 0.5 - titleRect.size.width * 0.5;
//    titleRect.origin.y = self.frame.size.height * 0.5 ;
//    
//    self.imageView.frame = imageRect;
//    self.titleLabel.frame = titleRect;
//}

//更改左右方向图片和文字的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect imageRect = self.imageView.frame;
    imageRect.origin.x = self.frame.size.width * 0.5 ;
    imageRect.origin.y = self.frame.size.height * 0.5  - imageRect.size.height * 0.5;
    
    CGRect titleRect = self.titleLabel.frame;
    titleRect.origin.x = self.frame.size.width * 0.5 - titleRect.size.width;
    titleRect.origin.y = self.frame.size.height * 0.5 - titleRect.size.height * 0.5;
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
}
@end
