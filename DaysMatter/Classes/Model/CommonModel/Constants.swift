//
//  Constants.swift
//  yyTools
//
//  Created by eric on 2019/11/16.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

struct Constants {
    public static var AppID:String {
        get {
            return "1495041057"
        }
    }
    public static var UMengAppID:String {
        get {
            return "60629c08de41b946ab341ad1"
        }
    }
    
    public static var UMengChannel:String {
        get {
            return "AppStore"
        }
    }
    
    public static var screenWidth:CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }
    
    public static var screenHeight:CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }
    
    public static var QQGroupID:String {
        get {
            return "1030545663"
        }
    }
    
    public static var privacyUrl:String {
        get {
            return "https://www.jianshu.com/p/f1a3dda0665a"
        }
    }

    
    /// 顶部安全区域高度，绝对竖屏下的高度
    static var safeAreaTopHeight: CGFloat {
        get {
            if #available(iOS 11.0, *) {
                if let window = UIApplication.shared.delegate?.window {
                    return window?.safeAreaInsets.top ?? 0
                }
            }
            return UIApplication.shared.statusBarFrame.height
        }
    }
    
    static var statusBarHeight:CGFloat {
        get {
            return UIApplication.shared.statusBarFrame.height
        }
    }
    /// 底部安全区域高度，绝对竖屏下的高度
    static var safeAreaBottomHeight: CGFloat {
        get {
            if #available(iOS 11.0, *) {
                if let window = UIApplication.shared.delegate?.window {
                    return window?.safeAreaInsets.top ?? 0
                }
            }
            return 0
        }
    }
    
    static var navigationBarHeight: CGFloat {
        get {
            return 44
        }
    }
    
    static var tabbarHeight:CGFloat {
        get {
            return 49
        }
    }
    
    /// statusbar + navigationBar
    static var topBarHeight: CGFloat {
        get {
            return Constants.safeAreaTopHeight + Constants.navigationBarHeight
        }
    }
    
    /// 是否iphonex
    public static var isIPhoneX:Bool {
        get {
            if Constants.safeAreaBottomHeight > 0 {
                return true
            }
            return false
        }
    }
    
    
}
