//
//  AppDelegate.m
//  GIF动画集成
//
//  Created by 李晓博 on 2017/11/24.
//  Copyright © 2017年 李晓博. All rights reserved.
//
#import "UIImageView+AnimationImage.h"
#import "AppDelegate.h"
#import "UIImage+GIF.h"
#import "KKSequenceImageView.h"
#import "FLAnimatedImage.h"

@interface AppDelegate ()<KKSequenceImageDelegate>
@end

@implementation AppDelegate
{
    KKSequenceImageView* imageView;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /** makeKeyAndVisible */
    [self.window makeKeyAndVisible];
    
    /** 初始化imageView */
    imageView = [[KKSequenceImageView alloc] initWithFrame:CGRectMake(0, 0, self.window.screen.bounds.size.width,self.window.screen.bounds.size.height)];
    NSMutableArray* images = [NSMutableArray array];
    
    /** 加载图片 */
    for (int i = 1; i <= 90; i++)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"图层 %d",i] ofType:@"png"];
        if (path.length) {
            [images addObject:path];
        }
    }
    
    /** 设置参数 */
    imageView.imagePathss = images;
    imageView.durationMS = images.count * 60;
    imageView.repeatCount = 1;
    imageView.delegate = self;
    
    /** 添加到window */
    [_window addSubview:imageView];
    [imageView begin];
    return YES;
}

#pragma mark -- 代理方法
- (void)sequenceImageDidPlayCompeletion:(KKSequenceImageView *)imageView
{
    /** 运行完成--clean */
    [imageView removeFromSuperview];
    imageView = nil;
}
-(void)removerView
{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
