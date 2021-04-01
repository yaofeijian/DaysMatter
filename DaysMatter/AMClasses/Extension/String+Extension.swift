//
//  String+Extension.swift
//  yyTools
//
//  Created by 姚飞剑 on 2019/3/16.
//  Copyright © 2019 yy. All rights reserved.
//

import Foundation

extension String {
    var l: String {
        get {
            return NSLocalizedString(self, comment: "\(self)，key错误")
        }
    }
    
    ///是否是无符号整数字符串0-N
    var isValidUInt:Bool {
        get {
            let reg = "^[0-9]*$"
            let pre = NSPredicate(format: "SELF MATCHES %@", reg)
            if pre.evaluate(with: self) {
                return true
            }else{
                return false
            }
        }
    }
    
    func appendEnter() -> String {
        var output = ""
        self.enumerated().forEach { (offset, element) in
            output.append(element)
            if offset != count - 1 {
                output += "\n"
            }
        }
        return output
    }
    
    func boundingRectWithCeil(_ font:UIFont) -> CGSize {
        let size = (self as NSString).boundingRect(with: CGSize.init(width: 99999, height: 99999), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:font], context: nil).size
        return CGSize.init(width: ceil(size.width), height: ceil(size.height))
    }
}


