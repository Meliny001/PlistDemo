//
//  Status.h
//  Plist文件相关
//
//  Created by Zhuge_Magic on 2017/2/17.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject

@property(nonatomic,copy) NSString * created_at;
@property(nonatomic,copy) NSString * idstr;
@property (nonatomic,assign) NSInteger attitudes_count;

/**
 *  字典->模型(类方法)
 */
+ (instancetype)sharedStatusWithDataDictionary:(NSDictionary *)dict;
/**
 *  字典->模型(对象方法)
 */
- (instancetype)initWithDataDictionary:(NSDictionary *)dict;

@end
