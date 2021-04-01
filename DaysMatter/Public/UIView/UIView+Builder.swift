//
//  UIView+Build.swift
//  yyTools
//
//  Created by eric on 2019/11/19.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit
import SnapKit

protocol ViewBuilderProtocol {

}

extension ViewBuilderProtocol where Self : UIView {
//    @discardableResult
    func builder(_ build:(Self) -> Void) -> Self {
        build(self)
        return self
    }
}

extension UIView:ViewBuilderProtocol {
//    @discardableResult
    func add(toSuperView: UIView) -> Self {
        toSuperView.addSubview(self)
        return self
    }
    
//    @discardableResult
    func layout(snapKitMaker: (ConstraintMaker) -> Void) -> Self {
        self.snp.makeConstraints { (make) in
            snapKitMaker(make)
        }
        return self
    }
}
