//
//  ReachabilityManager.swift
//  yyTools
//
//  Created by eric on 2019/11/16.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

class AMReachabilityManager: NSObject {
    static let `default`:AMReachabilityManager = AMReachabilityManager()
//    static let  ReachabilityManagerNotificationName = Notification.Name(rawValue: "ReachabilityManagerNotificationName")
    
    public var connection:Reachability.Connection = Reachability.Connection.cellular
    
    var reachability : Reachability!
    
    private override init() {
        
    }
    func startListen() {
        do{
            reachability = try Reachability()
            NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged),name:Notification.Name.reachabilityChanged, object: reachability)
            // 3、开启网络状态消息监听
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    // 主动检测网络状态
    @objc
    private func reachabilityChanged(note: NSNotification) {
        let reachability = note.object as! Reachability // 准备获取网络连接信息
        if reachability.connection != .unavailable { // 判断网络连接状态
            print("网络连接：可用")
            if reachability.connection == .wifi { // 判断网络连接类型
                print("连接类型：WiFi")
                self.connection = .wifi
            } else {
                print("连接类型：移动网络")
                self.connection = .cellular
            }
        } else {
            print("网络连接：不可用")
            self.connection = .unavailable
        }
    }
}
