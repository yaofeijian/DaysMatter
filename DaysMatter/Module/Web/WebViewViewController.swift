//
//  WebViewViewController.swift
//  yyTools
//
//  Created by eric on 2019/11/10.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: BaseViewController {
    private lazy var webView:WKWebView = {
        let v = WKWebView.init()
        v.navigationDelegate = self
        v.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        return v
    }()
    
    var url:String = "" {
        didSet {
            self.webView.load(URLRequest.init(url: URL.init(stringLiteral: url)))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setIndicatorColor(.theme)
        self.backImageColor = .theme
        self.view.addSubview(self.webView)
        self.view.backgroundColor = .black
        self.webView.backgroundColor = .black
        
        self.webView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    deinit {
        self.webView.removeObserver(self, forKeyPath: "title")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            // Fallback on earlier versions
        }
        return .default
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "title" {
            if (object as? WKWebView) == self.webView {
                self.title = self.webView.title
                return
            }
        }
        super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WebViewViewController:WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.showLoading()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.dismissLoading()
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.dismissLoading()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.dismissLoading()
    }
}
