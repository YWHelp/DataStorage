//
//  XML.m
//  DataStorage
//
//  Created by changcai on 17/4/19.
//  Copyright © 2017年 changcai. All rights reserved.
//


/*
 
 属性列表是一种XML格式的文件，拓展名为plist
 
 如果对象是NSString、NSDictionary、NSArray、NSData、NSNumber等类型，就可以使用writeToFile:atomically:方法直接将对象写到属性列表文件中
 */

#import "XML.h"
@implementation XML

//将一个NSDictionary对象归档到一个plist属性列表中
- (void)storageData
{
    // 将数据封装成字典
    NSString *home = NSHomeDirectory();
    NSString *documents = [home stringByAppendingPathComponent:@"Documents"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"母鸡" forKey:@"name"];
    [dict setObject:@"15013141314" forKey:@"phone"];
    [dict setObject:@"27" forKey:@"age"];
    // 将字典持久化到Documents/stu.plist文件中
    [dict writeToFile:documents atomically:YES];

}
//读取属性列表，恢复NSDictionary对象
- (void)drawData
{
    // 读取Documents/stu.plist的内容，实例化NSDictionary
    NSString *home = NSHomeDirectory();
    NSString *documents = [home stringByAppendingPathComponent:@"Documents"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:documents];
    NSLog(@"name:%@", [dict objectForKey:@"name"]);
    NSLog(@"phone:%@", [dict objectForKey:@"phone"]);
    NSLog(@"age:%@", [dict objectForKey:@"age"]);
}

@end
