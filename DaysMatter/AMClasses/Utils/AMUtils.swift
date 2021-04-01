//
//  Utils.swift
//  yyTools
//
//  Created by 姚飞剑 on 2019/3/19.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

class AMUtils: NSObject {
    static func showNoPermissionAlertMessage(permission:String) {
        let alertVC = UIAlertController.init(title: ("无法使用".l + permission), message: ("此应用程序可能没有权限访问您的".l + permission), preferredStyle: .alert)
        
        let confirmAction = UIAlertAction.init(title: "打开".l, style: .default) { (action) in
            AMUtils.openSystemSettings()
        }
        let cancelAction = UIAlertAction.init(title: "取消".l, style: .default) { (action) in
            
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(confirmAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertVC, animated: true, completion: nil)
    }
    
    static func openSystemSettings() {
        if let url = URL.init(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    static func openQQGroup() {
        let urlStr = "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=" + "\(Constants.QQGroupID)" + "&key=" + "738fc81f0aecb0761da715c704b6e6335feb395e77dccc2a0c03f7166d162129" + "&card_type=group&source=external"
        let url = URL.init(string: urlStr)
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.openURL(url!)
        }
    }
    
    static func random(min: Int, max: Int) -> Int {
        if min == max {
            return min
        }
        let r = arc4random()
        return Int(r % UInt32(max - min) + UInt32(min))
    }
    
    static func secondsToHms(seconds:Int64) -> String {
        let s = seconds%60
        let m = (seconds/60)%60
        let h = seconds/3600
        
        var text = ""
        if h > 0 {
            text +=  String.init(format: "%02d时", h)
        }
        if m > 0 {
            text += String.init(format: "%02d分", m)
        }
        if s > 0 {
            text += String.init(format: "%02d秒", s)
        }
        return text
    }
    
    static func viewSafeAreaLeftWidth() -> CGFloat {
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.delegate?.window {
                if UIApplication.shared.statusBarOrientation == .portrait ||
                    UIApplication.shared.statusBarOrientation == .portraitUpsideDown {
                    return 0//window?.safeAreaInsets.top ?? 0
                }else {
                    if UIApplication.shared.statusBarOrientation == .landscapeLeft {
                        return window?.safeAreaInsets.right ?? 0
                    }else {
                        return window?.safeAreaInsets.left ?? 0
                    }
                }
            }
        }
        return 0
    }
    
    static func viewSafeAreaRightWidth() -> CGFloat {
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.delegate?.window {
                if UIApplication.shared.statusBarOrientation == .portrait ||
                    UIApplication.shared.statusBarOrientation == .portraitUpsideDown {
                    return 0//window?.safeAreaInsets.top ?? 0
                }else {
                    if UIApplication.shared.statusBarOrientation == .landscapeLeft {
                        return window?.safeAreaInsets.right ?? 0
                    }else {
                        return window?.safeAreaInsets.left ?? 0
                    }
                }
            }
        }
        return 0
    }
}

