//
//  YMNotification.h
//  iOS-Notification
//
//  Created by Ezreal on 2018/10/19.
//  Copyright © 2018年 liuyiming. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMNotification : NSObject

/**
 * 通知name
 */
@property(nonatomic, strong) NSString *name;

/**
 * 通知接受者
 */
@property(nonatomic, strong) id observer;

/**
 * 接受通知方法
 */
@property(nonatomic, assign) SEL selector;


@end

NS_ASSUME_NONNULL_END
