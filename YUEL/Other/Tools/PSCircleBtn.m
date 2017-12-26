//
//  PSCircleBtn.m
//  YUEL
//
//  Created by sunny&pei on 2017/12/7.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import "PSCircleBtn.h"

@implementation PSCircleBtn

+(PSCircleBtn *)circleBtn{
    PSCircleBtn *btn = [[PSCircleBtn alloc]init];
    
    return btn;
}

- (void)makecircle {
    self.layer.cornerRadius = 30;
    self.clipsToBounds = YES;
}

@end
