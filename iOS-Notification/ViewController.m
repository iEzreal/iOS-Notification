//
//  ViewController.m
//  iOS-Notification
//
//  Created by Ezreal on 2018/10/19.
//  Copyright © 2018年 liuyiming. All rights reserved.
//

#import "ViewController.h"
#import "NextController.h"

#import "YMNotificationCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor purpleColor];
    [button setTitle:@"发送通知" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(postNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(100, 200, 100, 50);
    but.backgroundColor = [UIColor purpleColor];
    [but setTitle:@"移除通知" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(removeNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    YMNotificationCenter *nCenter = [YMNotificationCenter defaultCenter];
    [nCenter addObserver:self selector:@selector(receiveNotification) name:@"test"];
}

- (void)postNotification {
    NSLog(@"--- 发送消息通知 --- ");
    YMNotificationCenter *nCenter = [YMNotificationCenter defaultCenter];
    [nCenter postNotificationName:@"test" userInfo:nil];
}

- (void)receiveNotification {
    NSLog(@"--- 接收到消息通知 --- ");
}

- (void)removeNotification {
    NSLog(@"--- 移除消息通知 --- ");
    YMNotificationCenter *nCenter = [YMNotificationCenter defaultCenter];
    [nCenter removeObserver:self name:@"test"];
}

@end
