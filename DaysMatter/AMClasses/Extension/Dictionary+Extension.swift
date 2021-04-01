//
//  Dictionary+Extension.swift
//  YYTools
//
//  Created by eric on 2019/12/14.
//  Copyright © 2019 yy. All rights reserved.
//

import Foundation

extension Dictionary {
    func toString() -> String? {
        let data = try? JSONSerialization.data(withJSONObject: self, options: [])
        if let data = data {
            let str = String(data: data, encoding: String.Encoding.utf8)
            return str
        }
        return nil
        
    }
}
