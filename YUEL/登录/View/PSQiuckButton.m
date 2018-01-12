//
//  PSQiuckButton.m
//  LPZ百思不得
//
//  Created by sunny&pei on 2017/8/8.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSQiuckButton.h"

@implementation PSQiuckButton
-(void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.xmg_y=0;
    self.imageView.xmg_centerX = self.xmg_width *0.5;
    
    self.titleLabel.xmg_x = 0;
    self.titleLabel.xmg_y = self.imageView.xmg_bottom;
    self.titleLabel.xmg_height = self.xmg_height-self.imageView.xmg_height;
    self.titleLabel.xmg_width = self.xmg_width;
}

@end
