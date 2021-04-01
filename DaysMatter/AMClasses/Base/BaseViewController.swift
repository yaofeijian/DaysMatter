//
//  BaseViewController.swift
//  yyTools
//
//  Created by hj on 2019/2/18.
//  Copyright © 2019年 yy. All rights reserved.
//

import UIKit
import AVFoundation


class BaseViewController: UIViewController {

    private var viewWillAppearFirstTime = true
    
    typealias BackButtonBlock = () -> Void
    
    var backButtonBlock:BackButtonBlock?
    
    var backImageColor:UIColor = .white {
        didSet {
            let backIcon = UIImage.init(named: "icon_back")?.tint(color: backImageColor)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: backIcon?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(pop))
        }
    }
    
    ///默认false，在viewWillAppearFirstTime中重新处理过，如果不处理，二级页面会出现statusbar 覆盖 navigationbar，暂时简单处理
    var statusBarHidden = true {
        didSet {
            UIView.animate(withDuration: 0.3) { () -> Void in
                self.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }

    var didLoadShouldUpdateStatusBarHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.background
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(pop))
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if viewWillAppearFirstTime {
            viewWillAppearFirstTime(animated)
            viewWillAppearFirstTime = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public func viewWillAppearFirstTime(_ animated : Bool) {
        if didLoadShouldUpdateStatusBarHidden {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                self.statusBarHidden = false
            }
        }
    }
    
    @objc func pop() {
        if let backButtonBlock = backButtonBlock {
            backButtonBlock()
        }else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    deinit {
        print("yyTools deinit:\(self)")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return statusBarHidden
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.landscapeRight,.landscapeLeft]
    }
}

///
extension BaseViewController {
    
}
