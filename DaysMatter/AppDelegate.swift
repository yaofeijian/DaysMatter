//
//  AppDelegate.swift
//  DaysMatter
//
//  Created by eric on 2020/1/14.
//  Copyright © 2020 eric. All rights reserved.
//

import UIKit
import IQKeyboardManager
import FDFullscreenPopGesture
import SDWebImage


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    private var timer:Timer?
    private var bgTask:UIBackgroundTaskIdentifier?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
       
        window?.rootViewController = UIViewController.init()
        window?.makeKeyAndVisible()
        ///初始化UMeng基础统计（用户统计）
        UMConfigure.initWithAppkey(Constants.UMengAppID, channel: Constants.UMengChannel)
        ///iqkeyboard
        IQKeyboardManager.shared().isEnableAutoToolbar = false
        SDImageCache.shared.config.maxDiskAge = -1
        setup()
        initNavigationBar()
        setupPush(application, didFinishLaunchingWithOptions: launchOptions)
    
        window?.rootViewController = AppDelegateManager.default.tabBarViewController
        
        return true
    }
    
    func setup() {
        do {
           let databaseURL = try FileManager.default
               .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
               .appendingPathComponent("daysMatter.sqlite")
            DBManager.default.dbQueue = try AppDatabase.openDatabase(atPath: databaseURL.path)
        }catch {
            print("openDatabase error")
        }
        AMReachabilityManager.default.startListen()
        ConfigManager.default.loadConfig()
        
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        comeToBackgroundMode()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        comeToForegroundMode()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

extension AppDelegate {
    private func setupPush(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        // Push组件基本功能配置
        
        let entity = UMessageRegisterEntity.init()
        //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标
        entity.types = Int(UMessageAuthorizationOptions.badge.rawValue|UMessageAuthorizationOptions.sound.rawValue|UMessageAuthorizationOptions.alert.rawValue);
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate=self
        } else {
            // Fallback on earlier versions
        };
        UMessage.registerForRemoteNotifications(launchOptions: launchOptions, entity: entity) { (granted, error) in
            
        }
        
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            center.requestAuthorization(options: [UNAuthorizationOptions.badge,UNAuthorizationOptions.alert,UNAuthorizationOptions.sound], completionHandler: { (granted, error) in
                
            })
        } else {
            // Fallback on earlier versions
        }
    }
    
    func initNavigationBar() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage.color(UIColor.background, size: CGSize.init(width: Constants.screenWidth, height: Constants.navigationBarHeight)), for: .default)
        navigationBar.shadowImage = UIImage.color(UIColor.backgroundSeparator, size: CGSize.init(width: Constants.screenWidth, height: 0.5))
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.text,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16.0)]
    }
    
    private func comeToBackgroundMode() {
        self.bgTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            if let bgTask = self.bgTask{
                UIApplication.shared.endBackgroundTask(bgTask)
            }
            self.bgTask = .invalid
        })
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 25, target: self, selector: #selector(applyForMoreTime), userInfo: nil, repeats: true)
            timer?.fire()
        }
    }

    private func comeToForegroundMode() {
        timer?.invalidate()
        timer = nil
    }
    @objc func applyForMoreTime() {
        //如果系统给的剩余时间小于60秒 就终止当前的后台任务，再重新初始化一个后台任务，重新让系统分配时间，这样一直循环下去，保持APP在后台一直处于active状态。
        if UIApplication.shared.backgroundTimeRemaining < 60 {
            if let bgTask = self.bgTask {
                UIApplication.shared.endBackgroundTask(bgTask)
            }
            self.bgTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
                if let bgTask = self.bgTask{
                    UIApplication.shared.endBackgroundTask(bgTask)
                }
                self.bgTask = .invalid
            })
        }
    }
}
