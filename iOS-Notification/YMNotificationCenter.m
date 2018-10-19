//
//  YMNotificationCenter.m
//  iOS-Notification
//
//  Created by Ezreal on 2018/10/19.
//  Copyright © 2018年 liuyiming. All rights reserved.
//

#import "YMNotificationCenter.h"

#import "YMNotification.h"

@interface YMNotificationCenter ()

@property(nonatomic, strong) NSMutableDictionary *nDic;

@end

@implementation YMNotificationCenter

static YMNotificationCenter *nCenter;
+ (instancetype)defaultCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nCenter = [[self alloc] init];
    });
    
    return nCenter;
}

- (instancetype)init {
    if (self = [super init]) {
        _nDic = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    
    return self;
}

- (void)addObserver:(id)observer selector:(SEL)selector name:(NSString *)name {
    YMNotification *notification = [[YMNotification alloc] init];
    notification.name = name;
    notification.observer = observer;
    notification.selector = selector;
    
    NSMutableArray *nArray = [_nDic objectForKey:name];
    if (nArray == nil) {
        nArray = [NSMutableArray arrayWithCapacity:1];
        [_nDic setObject:nArray forKey:name];
    }
    
    [nArray addObject:notification];
    
}

- (void)postNotificationName:(NSNotificationName)name userInfo:(nullable NSDictionary *)userInfo {
    NSArray *nArray = [_nDic valueForKey:name];
    if (nArray == nil || nArray.count == 0) {
        NSLog(@"--- 请添加观察者 ---");
        return;
    }
    
    [nArray enumerateObjectsUsingBlock:^(YMNotification *obj, NSUInteger idx, BOOL *stop) {
        [obj.observer performSelector:obj.selector withObject:userInfo];
    }];
}

- (void)removeObserver:(id)observer name:(NSString *)name {
    NSMutableArray *array = [_nDic valueForKey:name];
    [array enumerateObjectsUsingBlock:^(YMNotification *obj, NSUInteger idx, BOOL *stop) {
        if ([obj.observer isEqual:observer] && [obj.name isEqualToString:name]) {
            [array removeObject:obj];
        }
    }];
}

@end
