# DataStorage
iOS开发中一些常用的本地数据持久化详解
应用沙盒结构分析

Documents：保存应用运行时生成的需要持久化的数据，iTunes同步设备时会备份该目录。例如，游戏应用可将游戏存档保存在该目录

tmp：保存应用运行时所需的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行时，系统也可能会清除该目录下的文件。iTunes同步设备时不会备份该目录

Library/Caches：保存应用运行时生成的需要持久化的数据，iTunes同步设备时不会备份该目录。一般存储体积大、不需要备份的非重要数据

Library/Preference：保存应用的所有偏好设置，iOS的Settings(设置)应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录

应用沙盒目录的常见获取方式

沙盒根目录：NSString *home = NSHomeDirectory();

Documents：(2种方式)

利用沙盒根目录拼接”Documents”字符串

NSString *home = NSHomeDirectory();
NSString *documents = [home stringByAppendingPathComponent:@"Documents"];
// 不建议采用，因为新版本的操作系统可能会修改目录名
利用NSSearchPathForDirectoriesInDomains函数

// NSUserDomainMask 代表从用户文件夹下找
// YES 代表展开路径中的波浪字符“~”
NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
// 在iOS中，只有一个目录跟传入的参数匹配，所以这个集合里面只有一个元素
NSString *documents = [array objectAtIndex:0];
tmp：NSString *tmp = NSTemporaryDirectory();

Library/Caches：(跟Documents类似的2种方法)

利用沙盒根目录拼接”Caches”字符串
利用NSSearchPathForDirectoriesInDomains函数(将函数的第1个参数改为：NSCachesDirectory即可)
Library/Preference：通过NSUserDefaults类存取该目录下的设置信息

内容参考------> http://www.jianshu.com/p/a3eeae99e902
