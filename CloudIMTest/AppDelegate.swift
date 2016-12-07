//
//  AppDelegate.swift
//  CloudIMTest
//
//  Created by 王凯 on 2016/11/28.
//  Copyright © 2016年 王凯. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?

    // 根据userid返回用户信息(RCIMUserInfoDataSource的代理方法,必须实现)
    func getUserInfo(withUserId userId: String!, completion: ((RCUserInfo?) -> Void)!) {
        
        // 初始化
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId {
        case "wangkai1":
            userInfo.name = "王凯"
            userInfo.portraitUri = "http://p5.gexing.com/GSF/touxiang/20161129/22/3igfgv38anjlsufkiwqqstazd.jpg@!200x200_3?recache=20131108"
            
        case "wangkai2":
            userInfo.name = "王凯2"
            userInfo.portraitUri = "http://p5.gexing.com/GSF/touxiang/20161129/23/4lbhhrbb6mvbuhxkjoejr6ie3.jpg@!200x200_3?recache=20131108"
            
        default:
            print("无此用户")
          
        }
        return completion(userInfo)
    }

    func connectServer(completion:@escaping ()->Void) {
        // 查询保存token
//        let tokenCache = UserDefaults.standard.object(forKey: "kDeviceToken") as? String
        
        
        // 初始化appkey
        RCIM.shared().initWithAppKey("pgyu6atqpna9u")
        // 用token测试连接
        RCIM.shared().connect(withToken: "mXstrKLY/14YuWZES/n4a7/dDk/KYKadAa06DWAtELtGlicGzl+qzF5znarbCLm+yMvuGq7lUVslQf6a9mocmSJdw4LXa09t", success: { (_) -> Void in
            
            print("连接成功1")
            
            // 调用主线程,更新界面UI样式
            DispatchQueue.main.async {
                completion()
            }
            
            
            

        }, error: { (_) -> Void in
            print("连接失败")
        }, tokenIncorrect: { (_) -> Void in
            print("Token不正确, 或已经失效")
        })

    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       
        
        // 设置用户信息提供者为自己 AppDelegate (设置代理人为自己)
        RCIM.shared().userInfoDataSource = self
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

