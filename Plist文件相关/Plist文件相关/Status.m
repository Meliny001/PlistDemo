//
//  Status.m
//  Plist文件相关
//
//  Created by Zhuge_Magic on 2017/2/17.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "Status.h"
#import <objc/message.h>
@interface Status ()<NSCoding>

@end

@implementation Status
+ (instancetype)sharedStatusWithDataDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDataDictionary:dict];
}
- (instancetype)initWithDataDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.attitudes_count = [dict[@"attitudes_count"] integerValue];
        self.idstr = dict[@"idstr"];
        self.created_at = dict[@"created_at"];
    }
    return self;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"idstr:%@-attitudes:%zi-create:%@",_idstr,_attitudes_count,_created_at];
}
// 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count;
    objc_property_t * propertyList = class_copyPropertyList(self.class, &count);
    for (int i = 0; i <count; i ++) {
        objc_property_t proerty = propertyList[i];
        NSString * key = [NSString stringWithUTF8String:property_getName(proerty)];
        NSString * value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
    free(propertyList);
    return self;
}
// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count;
    objc_property_t * propertyList = class_copyPropertyList(self.class, &count);
    for (int i = 0; i <count; i ++) {
        objc_property_t proerty = propertyList[i];
        NSString * key = [NSString stringWithUTF8String:property_getName(proerty)];
        NSString * value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(propertyList);
}
@end
