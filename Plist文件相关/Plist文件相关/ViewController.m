//
//  ViewController.m
//  Plist文件相关
//
//  Created by Zhuge_Magic on 2017/2/17.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Plist.h"
#import "Status.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * path = [NSObject pathForPlist:@"status.plist"];
    NSMutableArray * dataArr = [NSMutableDictionary dictionaryWithContentsOfFile:path][@"statuses"];
    NSString * writeToPath = [NSObject pathForDocumentDirectory];
    
    ZGLog(@"%@",writeToPath);
    
    NSArray * classNames = @[@"NSNumber",@"NSString",@"NSArray",@"NSDictionary"];
    NSArray * names = @[@"source",@"idstr",@"text"];
    
    // 拆分plist
    [NSObject selectArray:dataArr byPropertyNames:names writeToDirectoryPath:writeToPath];
    [NSObject selectArray:dataArr byClassNames:classNames writeToDirectoryPath:writeToPath];
    
    // 存入模型
    NSMutableArray * statusArr = [NSMutableArray array];
    for (NSDictionary * dict in dataArr) {
        Status * status = [Status sharedStatusWithDataDictionary:dict];
        [statusArr addObject:status];
    }
    ZGLog(@"%@",statusArr);
    
    // 归档
    NSString * statusPath = [writeToPath stringByAppendingPathComponent:@"status.plist"];
    [NSKeyedArchiver archiveRootObject:statusArr toFile:statusPath];
    // 解档
    NSArray * arr = [NSKeyedUnarchiver unarchiveObjectWithFile:statusPath];
    ZGLog(@"%@",arr);
}
@end
