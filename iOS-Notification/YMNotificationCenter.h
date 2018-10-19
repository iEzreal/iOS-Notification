//
//  YMNotificationCenter.h
//  iOS-Notification
//
//  Created by Ezreal on 2018/10/19.
//  Copyright © 2018年 liuyiming. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMNotificationCenter : NSObject

+ (instancetype)defaultCenter;
- (void)addObserver:(id)observer selector:(SEL)selector name:(NSString *)name;
- (void)postNotificationName:(NSNotificationName)name userInfo:(nullable NSDictionary *)userInfo;
- (void)removeObserver:(id)observer name:(NSNotificationName)name;

@end

NS_ASSUME_NONNULL_END
