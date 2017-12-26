//
//  PSHoriBtn.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/7.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSHoriBtn.h"
#define kTitleRatio 0.2
@implementation PSHoriBtn
+(instancetype)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)titleFont textAlignment:(NSTextAlignment)textAlignment image:(UIImage *)image imageViewContentMode:(UIViewContentMode *)imageViewContentMode{
    
    PSHoriBtn *button = [ super buttonWithType:buttonType];
    
    //button的frame
    button.frame = frame;
    //文字居中
    button.titleLabel.textAlignment = textAlignment;
    //文字大小
    button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    
    //文字颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //图片填充的内容模式
    button.imageView.contentMode = imageViewContentMode;
    //button的title
    [button setTitle:title forState:UIControlStateNormal];
    //button的image
    [button setImage:image forState:UIControlStateNormal];
    return button;
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imgX = 0;
    CGFloat imgY = 0;
    CGFloat imgW = contentRect.size.width / 3;
    CGFloat imgH = contentRect.size.height;
    // * (1-kTitleRatio)
    return CGRectMake(imgX, imgY, imgW, imgH);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = contentRect.size.width / 3;
    CGFloat titleH = contentRect.size.height;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width *(1-1/3);
    
    
    return CGRectMake(titleX , titleY  , titleW, titleH);
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

- (void)click:(PSHoriBtn *)btn
{
    if (_block) {
        _block(btn);
    }
}
@end
