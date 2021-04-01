//
//  UITableView+Extension.swift
//  yyTools
//
//  Created by eric on 2019/11/16.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

fileprivate struct ReusableIdentifier<T:UIView> {
    let identifier:String
    
    init() {
        identifier = "\(T.self)"
    }
}
extension UITableView {
    
    func register<T:UITableViewCell>(_:T.Type) {
        register(T.self, forCellReuseIdentifier: ReusableIdentifier<T>().identifier)
    }
    func dequeue<T:UITableViewCell>(indexPath:IndexPath) -> T {
        let reusableIdentifierID = ReusableIdentifier<T>().identifier
        let cell = dequeueReusableCell(withIdentifier: reusableIdentifierID, for: indexPath) as? T
        if let cell = cell {
            return cell
        }
        assertionFailure("您可能没有注册cell，请先调用（register）方法注册")
        return T.init()
    }
}
