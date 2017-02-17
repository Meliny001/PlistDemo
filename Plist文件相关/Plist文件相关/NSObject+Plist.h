//
//  NSObject+Plist.h
//  Plist文件相关
//
//  Created by Zhuge_Magic on 2017/2/17.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Plist)
/**
 *  Plist文件的拆分-(按照类名)
 *
 *  @param dataArr plist源数据
 *  @param names   类名数组
 *  @param dirPath 写入文件路径
 */
+ (void)selectArray:(NSArray *)dataArr byClassNames:(NSArray *)names writeToDirectoryPath:(NSString *)dirPath;
/**
 *  Plist文件的拆分-(按照属性名)
 *
 *  @param dataArr plist源数据
 *  @param names   属性名数组
 *  @param dirPath 写入文件路径
 */
+ (void)selectArray:(NSArray *)dataArr byPropertyNames:(NSArray *)names writeToDirectoryPath:(NSString *)dirPath;
/**
 *  获取Plist文件路径
 *
 *  @param name 文件名
 *
 *  @return 路径
 */
+ (NSString *)pathForPlist:(NSString *)name;
/**
 *  获取沙盒Document路径
 */
+ (NSString *)pathForDocumentDirectory;

@end
