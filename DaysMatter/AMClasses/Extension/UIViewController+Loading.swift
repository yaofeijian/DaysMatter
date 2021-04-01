//
//  UIViewController+Loading.swift
//  yyTools
//
//  Created by 姚飞剑 on 2019/4/5.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

fileprivate var loadingViewKey = "loadingView"

extension BaseViewController {
    fileprivate var loadingView: LoadingView? {
        set {
            objc_setAssociatedObject(self, &loadingViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &loadingViewKey) as? LoadingView
        }
    }
    
    fileprivate func getLoadingView() -> LoadingView {
        if self.loadingView == nil {
            self.loadingView = LoadingView.init(centerPoint: self.view.center)
        }
        return self.loadingView!
    }
    
    func showLoading() {
        if !self.view.subviews.contains(self.getLoadingView()) {
            self.view.addSubview(self.getLoadingView())
        }
        self.getLoadingView().startAnimating()
    }
    
    func dismissLoading() {
        self.getLoadingView().stopAnimating()
    }
    
    func setIndicatorColor(_ color : UIColor) {
        self.getLoadingView().setIndicatorColor(color)
    }
    
    
    
}
