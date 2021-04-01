//
//  UIImpactFeedbackGeneratorUtils.swift
//  YYTools
//
//  Created by eric on 2019/12/18.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

enum ButtonFeedBackStyle {
    case light
    
    case medium
    
    case heavy
    
    case soft
    
    case rigid
    
    @available(iOS 10.0, *)
    var systemFeedBackStyle : UIImpactFeedbackGenerator.FeedbackStyle {
        get {
            switch self {
            case .light:
                return .light
            case .medium:
                return .medium
            case .heavy:
                return .heavy
            case .soft:
                if #available(iOS 13.0, *) {
                    return .soft
                } else {
                    // Fallback on earlier versions
                    return .light
                }
            case .rigid:
                if #available(iOS 13.0, *) {
                    return .rigid
                } else {
                    // Fallback on earlier versions
                    return .medium
                }
//            @unknown default:
//                return .medium
            }
        }
    }
}

struct UIImpactFeedbackGeneratorUtils {
    ///light适用于按钮、medium重要反馈
    static func impactOccurred(_ style:ButtonFeedBackStyle = .medium) {
        if #available(iOS 10.0, *) {
            let impactFeedbackGenerator = UIImpactFeedbackGenerator.init(style: style.systemFeedBackStyle)
            impactFeedbackGenerator.impactOccurred()
        } else {
            // Fallback on earlier versions
        }
    }
}
