//
//  NSObject+Plist.m
//  Plist文件相关
//
//  Created by Zhuge_Magic on 2017/2/17.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "NSObject+Plist.h"

@implementation NSObject (Plist)
#pragma mark 通过类名拆分
+ (void)selectArray:(NSArray *)dataArr byClassNames:(NSArray *)names writeToDirectoryPath:(NSString *)dirPath
{
    for (NSString * name in names) {
        // 1.创建文件路径
        NSString * targetPath = [dirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",name]];
        
        NSMutableArray * targetArr = [NSMutableArray array];
        
        // 2.遍历查询
        for (NSDictionary * dict in dataArr)
        {
            NSMutableDictionary * targetDict = [NSMutableDictionary dictionary];
            
            for (NSString * key in [dict allKeys])
            {
                if([dict[key] isKindOfClass:NSClassFromString(name)])
                {
                    [targetDict setObject:dict[key] forKey:key];
                }
            }
            // 3.符合条件存入数组
            [targetArr addObject:targetDict];
        }
        
        // 4.写入文件
        [targetArr writeToFile:targetPath atomically:YES];
    }
}

#pragma mark 通过属性名拆分
+ (void)selectArray:(NSArray *)dataArr byPropertyNames:(NSArray *)names writeToDirectoryPath:(NSString *)dirPath
{
    for (NSString * name in names) {
        // 1.创建文件路径
        NSString * targetPath = [dirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",name]];
        
        NSMutableArray * targetArr = [NSMutableArray array];
        
        // 2.遍历查询
        for (NSDictionary * dict in dataArr)
        {
            NSMutableDictionary * targetDict = [NSMutableDictionary dictionary];
            
            for (NSString * key in [dict allKeys])
            {
                if([key isEqualToString:name])
                {
                    [targetDict setObject:dict[key] forKey:key];
                }
            }
            // 3.符合条件存入数组
            [targetArr addObject:targetDict];
        }
        
        // 4.写入文件
        [targetArr writeToFile:targetPath atomically:YES];
    }
}
#pragma mark 获取plist文件路径
+ (NSString *)pathForPlist:(NSString *)name
{
    return [[NSBundle mainBundle] pathForResource:name ofType:nil];
}
#pragma mark 获取沙盒Document路径
+ (NSString *)pathForDocumentDirectory
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}
@end
