//
//  URL+Extension.swift
//  yyTools
//
//  Created by 姚飞剑 on 2019/6/13.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

extension URL: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: StringLiteralType) {
        guard let url = URL(string: "\(value)") else {
            preconditionFailure("This url: \(value) is not invalid")
        }
        self = url

    }
}
extension URL {
//    public init(string value:String) {
//        self.
//    }
}
