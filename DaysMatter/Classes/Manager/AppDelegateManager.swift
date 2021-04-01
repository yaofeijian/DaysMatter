//
//  AppDelegateManager.swift
//  yyTools
//
//  Created by hj on 2019/2/19.
//  Copyright © 2019年 yy. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import AppVersionMonitor


/// 承接AppDelegate类，减轻Appdelegate负担
class AppDelegateManager: NSObject {
    static let `default`:AppDelegateManager = AppDelegateManager()
    
    var allowRotation = false
    var tabBarViewController = TabBarViewController()
    
    private override init() {
        super.init()
        self.initVendors()
        self.initYY()
        tabBarViewController.setupViewControllers()
    }
}

///lifcycle
extension AppDelegateManager {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if allowRotation {
            return .landscapeRight
        }
        return .portrait
    }
}

extension AppDelegateManager {
    var delegate:AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
}

private extension AppDelegateManager {
    ///初始化第三方库
    func initVendors() {
        ///初始化UMeng基础统计（用户统计）
        UMConfigure.initWithAppkey(Constants.UMengAppID, channel: Constants.UMengChannel)
    }
    
    func initYY() {
        AMReachabilityManager.default.startListen()
        initNavigationBar()
        initTextField()
        DispatchQueue.global().async {
            //初始化版本号，AppVersionMonitor可获得当前版本是否是升级上来，和用户所有安装的版本信息
            AppVersionMonitor.sharedMonitor.startup()
        }
    }
    func initNavigationBar() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage.color(UIColor.background, size: CGSize.init(width: Constants.screenWidth, height: Constants.navigationBarHeight)), for: .default)
        navigationBar.shadowImage = UIImage.color(UIColor.backgroundSeparator, size: CGSize.init(width: Constants.screenWidth, height: 0.5))
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.text,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16.0)]
    }
    
    func initTextField() {
        UITextField.appearance().tintColor = .theme
    }
}
