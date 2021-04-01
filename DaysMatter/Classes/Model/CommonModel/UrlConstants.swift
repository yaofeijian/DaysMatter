//
//  UrlConstant.swift
//  yyTools
//
//  Created by eric on 2019/11/16.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

struct UrlConstants {
    
    ///AM域名
    private static let baseApiUrl = "XXXXX"
    
    ///七牛域名
    private static let baseQNUrl = "http://amtools.com.cn/"
    

    ///易源域名
    private static let baseJuHeApiUrl = "http://api.avatardata.cn/"
    
    public static var config:String {
        get {
            return UrlConstants.baseQNUrl + "daysmatter_config.json" + "?t=\(Date().timeIntervalSince1970)"
        }
    }
}


