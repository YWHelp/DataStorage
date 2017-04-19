//
//  Preference.m
//  DataStorage
//
//  Created by changcai on 17/4/19.
//  Copyright © 2017年 changcai. All rights reserved.
//


/*
 Preference（偏好设置）
 很多iOS应用都支持偏好设置，比如保存用户名、密码、字体大小等设置，iOS提供了一套标准的解决方案来为应用加入偏好设置功能
 每个应用都有个NSUserDefaults实例，通过它来存取偏好设置
 比如，保存用户名、字体大小、是否自动登录
 */
#import "Preference.h"

@implementation Preference
- (void)storageData
{
    // 将数据封装成字典
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"itcast" forKey:@"username"];
    [defaults setFloat:18.0f forKey:@"text_size"];
    [defaults setBool:YES forKey:@"auto_login"];
}
//读取属性列表，恢复NSDictionary对象
- (void)drawData
{
  // 读取Documents/stu.plist的内容，实例化NSDictionary
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults stringForKey:@"username"];
    float size = [defaults floatForKey:@"text_size"];

}
@end
