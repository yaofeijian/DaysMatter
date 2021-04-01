//
//  AppStoreReviewManager.swift
//  yyTools
//
//  Created by eric on 2019/11/10.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit
import AppVersionMonitor
import StoreKit

class AppStoreUtils: NSObject {
    /// 标记应用内评分已显示
    static func markInAppCommentShowed() {
        let userDefaults = UserDefaults(suiteName: NSStringFromClass(AppStoreUtils.self))
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        userDefaults?.setValue(true, forKey: ("InAppCommentShowed" + AppVersion.marketingVersion.versionString))
    }
    /// 应用内评分是否显示过
    static func isShowinAppComment() -> Bool {
        let userDefaults = UserDefaults(suiteName: NSStringFromClass(AppStoreUtils.self))
        let value = userDefaults?.value(forKey: ("InAppCommentShowed" + AppVersion.marketingVersion.versionString)) as? Bool
        return value ?? false
    }
    
    /// 标记用户已经点击评论跳转去appstore
    static func markToAppStoreReviewClicked() {
        let userDefaults = UserDefaults(suiteName: NSStringFromClass(AppStoreUtils.self))
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        userDefaults?.setValue(true, forKey: ("ToAppStoreReviewClicked" + AppVersion.marketingVersion.versionString))
    }
    
    /// 是否已经点击过跳转去appstore评论
    static func isClickedToAppStoreReview() -> Bool {
        let userDefaults = UserDefaults(suiteName: NSStringFromClass(AppStoreUtils.self))
        let value = userDefaults?.value(forKey: ("ToAppStoreReviewClicked" + AppVersion.marketingVersion.versionString)) as? Bool
        return value ?? false
    }
    
    static func shouldShowInAppComment() -> Bool {
        return !AppStoreUtils.isShowinAppComment() && !AppStoreUtils.isClickedToAppStoreReview()
    }
    
    /// 显示应用内评分
    static func showInAppComment() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            let alertVC = UIAlertController.init(title:"给我们评价", message: "希望您给一个建议，帮助我们改善产品", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction.init(title: "确认".l, style: .default) { (action) in
                AppStoreUtils.markInAppCommentShowed()
                AppStoreUtils.markToAppStoreReviewClicked()
                AppStoreUtils.openAppStoreReview()
            }
            let cancelAction = UIAlertAction.init(title: "取消".l, style: .cancel) { (action) in
                
            }
            alertVC.addAction(confirmAction)
            alertVC.addAction(cancelAction)
            UIApplication.shared.keyWindow?.rootViewController?.present(alertVC, animated: true, completion: nil)
            
        }
    }
    
    static func openAppStoreReview(appID:String = Constants.AppID) {
        let urlStr = "itms-apps://itunes.apple.com/cn/app/id\(Constants.AppID)?mt=8&action=write-review"
        let url:URL = URL.init(stringLiteral: urlStr)
        UIApplication.shared.openURL(url)
    }
    
    static func openAppStore() {
        let urlStr = "itms-apps://itunes.apple.com/app/id\(Constants.AppID)"
        let url:URL = URL.init(stringLiteral: urlStr)
        UIApplication.shared.openURL(url)
    }
}

