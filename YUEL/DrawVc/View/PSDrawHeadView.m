//
//  PSDrawHeadView.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/7.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSDrawHeadView.h"
#import "PSCircleBtn.h"
@implementation PSDrawHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconBtn = [PSCircleBtn circleBtn];
        [self addSubview:self.iconBtn];

        self.nameLabel = [[UILabel alloc]init];
        [self.nameLabel setFont:[UIFont systemFontOfSize:30]];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.nameLabel];
        
        self.signLabel = [[UILabel alloc]init];
        [self.signLabel setFont:[UIFont systemFontOfSize:12]];
        self.signLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.signLabel];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];

        CGFloat iconX = 40;
        CGFloat iconY = self.frame.size.height/3;
        CGFloat iconW = 60;
        CGFloat iconH = iconW;
        [self.iconBtn makecircle];
        self.iconBtn.frame = CGRectMake(iconX, iconY, iconW, iconH);
        self.signLabel.frame = CGRectMake(iconX, iconY+iconW+5, 300, 30);
        self.nameLabel.frame = CGRectMake(iconX+iconW+20, iconY+15, 100, 30);
}
@end
