//
//  DateFormatterUtils.swift
//  YYTools
//
//  Created by eric on 2019/12/28.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

enum DateFormatterType {
    case yMd    ///yyyy-MM-dd
    case yMd_CN ///yyyy年MM月dd日
    case Hm ///HH:ss
    case yMdHm  ///yyyy-MM-dd HH:ss
    
    var dateFormatter:DateFormatter {
        switch self {
        case .yMd:
            return DateFormatterUtils.yMdDateFormatter
        case .yMd_CN:
            return DateFormatterUtils.yMdCNDateFormatter
        case .Hm:
            return DateFormatterUtils.hsDateFormatter
        case .yMdHm:
            return DateFormatterUtils.yMdHmDateFormatter
        }
    }
}

extension Date{
    func toString(_ dateFormatterType:DateFormatterType) -> String {
        return dateFormatterType.dateFormatter.string(from: self)
    }
    func isSameDay(date:Date) -> Bool {
        let calendar = Calendar.current
        let c1 = calendar.dateComponents([.year,.month,.day], from: self)
        let c2 = calendar.dateComponents([.year,.month,.day], from: date)
        if c1.year == c2.year && c1.month == c2.month && c1.day == c2.day {
            return true
        }
        return false
    }
}

extension String {
    func toDate(_ dateFormatterType:DateFormatterType) -> Date? {
        return dateFormatterType.dateFormatter.date(from: self)
    }
}


class DateFormatterUtils: NSObject {
    static var yMdDateFormatter:DateFormatter {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }
    }
    
    static var yMdCNDateFormatter:DateFormatter {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日"
            return formatter
        }
    }
    
    static var hsDateFormatter:DateFormatter {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }
    }
    static var yMdHmDateFormatter:DateFormatter {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            return formatter
        }
    }
}
