//
//  Config.swift
//  DaysMatter
//
//  Created by eric on 2020/4/8.
//  Copyright © 2020 eric. All rights reserved.
//

import UIKit
import HandyJSON


enum WeekDay:Int, HandyJSONEnum {
    case sunday = 1 ///星期天从1开始
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}
struct Soup:HandyJSON {
    var weekday:WeekDay?   ///1:周日，2:周一  ... 7:周六
    var content:String?     ///鸡汤内容
    var author:String?      ///作者
    var provider:String?    ///提供人
    
    static func load() -> Soup {
        let text = SharePreference.default[.soupModelPreferenceKey]
        var soup = JSONDeserializer<Soup>.deserializeFrom(json: text)
        if soup == nil {
            soup = Soup()
        }
        return soup!
    }
    
    func save() {
        let text  = self.toJSONString()
        SharePreference.default[.soupModelPreferenceKey] = text
    }
}
struct ClockConfig:HandyJSON {
    var soups:[Soup]? ///心灵鸡汤（排序:周一到周日）
}
