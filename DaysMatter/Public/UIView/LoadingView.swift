//
//  LoadingView.swift
//  yyTools
//
//  Created by 姚飞剑 on 2019/4/4.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    private lazy var iconImageView:UIImageView = {
        let v = UIImageView.init()
        v.image = UIImage.init(named: "loading_icon_indicator")
        return v
    }()
    
    private var centerPoint:CGPoint = .zero
    
    convenience init(centerPoint: CGPoint) {
        self.init()
        self.centerPoint = centerPoint
        self.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.centerPoint != .zero {
            self.snp.makeConstraints { (make) in
                make.center.equalTo(self.centerPoint)
                make.size.equalTo(self.iconImageView.image?.size ?? .zero)
            }
        }
    }

    func startAnimating() {
        let exsitAnimation = self.iconImageView.layer.animation(forKey: "loadingViewAnimation")
        if exsitAnimation == nil {
            let animation = CABasicAnimation.init(keyPath: "transform.rotation.z")
            animation.toValue = NSNumber.init(value: Double.pi*2)
            animation.duration = 2.25
            animation.isCumulative = true
            animation.repeatCount = MAXFLOAT
            animation.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
            self.iconImageView.layer.add(animation, forKey: "loadingViewAnimation")
            self.isHidden = false
        }
    }
    
    func stopAnimating() {
        let exsitAnimation = self.iconImageView.layer.animation(forKey: "loadingViewAnimation")
        if exsitAnimation != nil {
            self.iconImageView.layer.removeAnimation(forKey: "loadingViewAnimation")
            self.isHidden = true
        }
    }
    
    func setIndicatorColor(_ color : UIColor) {
        self.iconImageView.image = self.iconImageView.image?.tint(color: color)
    }
}
