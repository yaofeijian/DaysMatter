//
//  BaseNavigationController.swift
//  yyTools
//
//  Created by hj on 2019/2/18.
//  Copyright © 2019年 yy. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if #available(iOS 11.0, *) {
//            navigationBar.prefersLargeTitles = true
//            navigationItem.largeTitleDisplayMode = .automatic
//            navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//        } else {
//            // Fallback on earlier versions
//        }
//        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//        navigationBar.backgroundColor = .darkGray
//        navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationBar.shadowImage = UIImage()
//        navigationBar.isTranslucent = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return topViewController?.prefersStatusBarHidden ?? true
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
