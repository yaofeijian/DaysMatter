//
//  TabBarViewController.swift
//  yyTools
//
//  Created by hj on 2019/2/18.
//  Copyright © 2019年 yy. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class TabBarViewController:ESTabBarController {
    public func setupViewControllers() {
        if let tabBar = self.tabBar as? ESTabBar {
            tabBar.itemCustomPositioning = .fillExcludeSeparator
        }
        let homeVC = HomeViewController()
        let homeNavi = BaseNavigationController.init(rootViewController: homeVC)
        
        let importDayVC = ImportDayViewController()
        let importDayNavi = BaseNavigationController.init(rootViewController: importDayVC)
        
        let goldenTimesVC = GoldenTimesViewController()
        let goldenTimesNavi = BaseNavigationController.init(rootViewController: goldenTimesVC)
        
        let userVC = UserViewController()
        let userNavi = BaseNavigationController.init(rootViewController: userVC)
        
        
        homeNavi.tabBarItem = ESTabBarItem.init(TabBarItemContentView(), title: "主页".l, image: UIImage(named: "tabbar_home_normal"))
        
        importDayNavi.tabBarItem = ESTabBarItem.init(TabBarItemContentView(), title: "重要日子", image: UIImage(named: "tabbar_discover_normal"))
        
        goldenTimesNavi.tabBarItem = ESTabBarItem.init(TabBarItemContentView(), title: "流金岁月", image: UIImage(named: "tabbar_discover_normal"))
        
        userNavi.tabBarItem = ESTabBarItem.init(TabBarItemContentView(), title: "设置".l, image: UIImage(named: "tabbar_user_normal"))
        
       self.tabBar.barTintColor = .background
        
        
        self.viewControllers = [homeNavi, importDayNavi, goldenTimesNavi, userNavi]
    }
    
    
    /// 返回当前tabbarviewcontroller
    ///
    /// - Returns: tabbarviewcontroller
    static func `default`() -> ESTabBarController? {
        return AppDelegateManager.default.tabBarViewController
    }
}

