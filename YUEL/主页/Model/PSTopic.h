//
//  PSTopic.h
//  YUEL
//
//  Created by sunny&pei on 2017/12/22.
//  Copyright © 2017年 sunny&pei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,PSTopicType) {
    /** 全部 */
    PSTopicTypeAll = 1,
    /** 图片 */
    PSTopicTypePicture = 10,
    /** 段子 */
    PSTopicTypeWord = 29,
    /** 声音 */
    PSTopicTypeVoice = 31,
    /** 视频 */
    PSTopicTypeVideo = 41
};
@interface PSTopic : NSObject
/**
     用户名
 */
@property(nonatomic,copy)NSString *name;
/**
 用户头像
 */
@property (nonatomic,copy)NSString *icon;
/**
 文字内容
 */
@property (nonatomic,copy)NSString *text;
/**
 发布时间
 */
@property (nonatomic,copy)NSString *created_at;
/**
 帖子类型
 */
@property (nonatomic,assign)PSTopicType type;
/**
 图片的真实宽度
 */
@property (nonatomic, assign) CGFloat width;
/**
 图片的真实高度 
 */
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat cellHeight;
/** 小图 */
@property (nonatomic, copy) NSString *small_image;
/** 中图 */
@property (nonatomic, copy) NSString *middle_image;
/** 大图 */
@property (nonatomic, copy) NSString *large_image;
/**
 视频时长
 */
@property (nonatomic, assign) NSInteger videotime;
/***** 额外增加的属性 - 方便开发 *****/
/** cell的高度 */
@property (nonatomic, assign) BOOL is_gif;
/** 中间内容的frame */
@property (nonatomic, assign) CGRect contentF;
/** 是否为超长图片 */
@property (nonatomic, assign, getter=isBigPicture) BOOL bigPicture;
@end
