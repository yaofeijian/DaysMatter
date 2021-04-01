//
//  ConfigManager.swift
//  DaysMatter
//
//  Created by eric on 2020/4/8.
//  Copyright © 2020 eric. All rights reserved.
//

import UIKit
import HandyJSON

class ConfigManager: NSObject {
    
    enum LoadStatus {
        case none
        case loading
        case failed
        case success
    }
    
    static var `default`:ConfigManager = ConfigManager()
    public static let ConfigLoadCompleteNotification = Notification.Name.init(rawValue: "ConfigLoadCompleteNotification")
    
    private override init() {
        super.init()
        print("ConfigManager.init")

        NotificationCenter.default.addObserver(self, selector: #selector(onNotificationApplicationDidBecomActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    var loadStatus:LoadStatus = .none
    
    var config:ClockConfig?
    
    func loadConfig() {
        //已经成功过，不再加载
        if self.loadStatus == .success {
            NotificationCenter.default.post(name: ConfigManager.ConfigLoadCompleteNotification, object: nil)
            return
        }
        if self.loadStatus == .loading {
            return
        }
        self.loadStatus = .loading
        AMNetRequestManager.get(UrlConstants.config, header: nil) { (netResponse) in
            if netResponse.statusCode == 0 {
                self.config = JSONDeserializer<ClockConfig>.deserializeFrom(dict: netResponse.data)
                self.loadStatus = .success
                
            }else {
                self.config = nil
                self.loadStatus = .failed
            }
            NotificationCenter.default.post(name: ConfigManager.ConfigLoadCompleteNotification, object: nil)
        }
    }
    
    @objc private func onNotificationApplicationDidBecomActive() {
        ConfigManager.default.loadConfig()
    }
}
