//
//  UIColor+Extension.swift
//  yyTools
//
//  Created by hj on 2019/2/19.
//  Copyright © 2019年 yy. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 背景色 0x000000
    final class var background:UIColor {
        get {
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    /// 文字颜色（首页+功能页面文字颜色） 0xcccccc
    final class var text:UIColor {
        get {
            return #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        }
    }
    
    /// 文字灰色（场景一：分贝仪：”最大“） 0x999999
    final class var textGray:UIColor {
        get {
            return #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        }
    }
    
    /// 文字深灰色 0x666666
    final class var textDarkGray:UIColor {
        get {
            return #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        }
    }
    
    /// 文字背景颜色 0x111111
    final class var darkGray:UIColor {
        get {
            return #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        }
    }
    
    /// tabbar高亮色 0xf03c01
    final class var theme:UIColor {
        get {
            return #colorLiteral(red: 0.9411764706, green: 0.2352941176, blue: 0.003921568627, alpha: 1)
        }
    }
    
    /// tableview分割线颜色 0x666666
    final class var tableVieSeparator:UIColor {
        get {
            return #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        }
    }
    
    /// tabbar&navigationbar 0x222222
    final class var backgroundSeparator:UIColor {
        get {
            return #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
        }
    }
    
    /// 0x333333
    final class var backgroundGray:UIColor {
        get {
            return #colorLiteral(red: 0.1999762356, green: 0.200016588, blue: 0.1999709308, alpha: 1)
        }
    }
    
    //0x737373
    final class var backgroundLightColor:UIColor {
        get {
            return #colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1)
        }
    }
    
    final class var disableBackgroundColor:UIColor {
        get {
            return UIColor.init(rgba: 0xe6e6e680)
        }
    }
    
    final class var wifiQRBackgroundColor:UIColor {
        get {
            return UIColor.init(rgb: 0x1e113c)
        }
    }
    
    final class var random:UIColor {
        get {
            let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
            let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
            let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
            let alpha = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
            return UIColor.init(red:red, green:green, blue:blue , alpha: alpha)
        }
    }
    
    
    
    convenience init(rgb:UInt) {
        let r = CGFloat((rgb & 0xff0000) >> 16)
        let g = CGFloat((rgb & 0x00ff00) >> 8)
        let b = CGFloat((rgb & 0x0000ff))
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }

    convenience init(rgba:UInt) {
        let r = CGFloat((rgba & 0xff000000) >> 24)
        let g = CGFloat((rgba & 0x00ff0000) >> 16)
        let b = CGFloat((rgba & 0x0000ff00) >> 8)
        let a = CGFloat((rgba & 0x000000ff))
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/255.0)
    }

    static func rgbWithAlpha(rgb:UInt,a:UInt) -> UIColor {
        let r = CGFloat((rgb & 0xff0000) >> 16)
        let g = CGFloat((rgb & 0x00ff00) >> 8)
        let b = CGFloat((rgb & 0x0000ff))
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: CGFloat(a)/255.0)
    }
    
    private convenience init(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0);
    }
    
    private convenience init(hexString: String, alpha: CGFloat) {
        //删除字符串中的空格
        var cString:NSString = hexString.trimmingCharacters(in: CharacterSet.whitespaces).uppercased() as NSString
        // String should be 6 or 8 characters
        if cString.length < 6 {
            self.init();
            return;
        }
        // strip 0X if it appears
        //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
        if cString.hasPrefix("0X") {
            cString = cString.substring(from: 2) as NSString;
        }
        //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
        if cString.hasPrefix("#") {
            cString = cString.substring(from: 1) as NSString;
        }
        if cString.length != 6 {
            self.init();
            return;
        }
        
        // Separate into r, g, b substrings
        var range = NSRange();
        range.location = 0;
        range.length = 2;
        //r
        let rString = cString.substring(with: range);
        //g
        range.location = 2;
        let gString = cString.substring(with: range);
        //b
        range.location = 4;
        let bString = cString.substring(with: range);
        
        // Scan values
        var r:UInt32 = 0, g:UInt32 = 0, b:UInt32 = 0;
        (Scanner.localizedScanner(with: rString) as! Scanner).scanHexInt32(&r)
        (Scanner.localizedScanner(with: gString) as! Scanner).scanHexInt32(&g)
        (Scanner.localizedScanner(with: bString) as! Scanner).scanHexInt32(&b)
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha);
        
    }
}

