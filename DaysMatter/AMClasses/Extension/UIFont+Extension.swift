//
//  UIFont+Extension.swift
//  YYTools
//
//  Created by eric on 2019/12/28.
//  Copyright © 2019 yy. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    ///自定义字体
    enum CustomFontStyle {
        case poker
        case twoTech
        case sSTRIPE
        case one9000805
        case quartz
        case digital
        case chineseFunny
        case chineseFZFish
        case chineseFZSimple
        case chineseMajic
        case chineseModel
        case happyZcool
        case zhenyan
    }
    convenience init?(fontStyle:CustomFontStyle, ofSize size:CGFloat) {
        switch fontStyle {
        case .poker:
            self.init(name: "Poker style", size: size)
        case .twoTech:
            self.init(name: "2Tech", size: size)
        case .sSTRIPE:
            self.init(name: "TsangerZYXWZT-W01", size: size)
        case .one9000805:
            self.init(name: "1900.80.5", size: size)
        case .quartz:
            self.init(name: "Quartz", size: size)
        case .digital:
            self.init(name: "Digital-7 Mono", size: size)
        case .chineseFunny:
            
            self.init(name: "zihun130hao-kuaileqiaoheitifeishangyong-Regular", size: size)
        case .chineseFZFish:
            self.init(name: "FZPangTouYu-M24S", size: size)
        case .chineseFZSimple:
            self.init(name: "FZCuHei-B03T", size: size)
        case .chineseMajic:
            self.init(name: "zihun148hao-zhengkumofangtifeishangyong-Regular", size: size)
        case .chineseModel:
            self.init(name: "ShiShangZhongHeiJianTi", size: size)
        case .happyZcool:
            self.init(name: "HappyZcool-2016", size: size)
        case .zhenyan:
            self.init(name: "ZhenyanGB-Regular", size: size)
        }
    }
}
