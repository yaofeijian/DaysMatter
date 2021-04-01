//
//  NotificationUtils.swift
//  DaysMatter
//
//  Created by eric on 2020/3/27.
//  Copyright © 2020 eric. All rights reserved.
//

import UIKit

class NotificationUtils: NSObject {
    
   static func systemNotificationStateIsOn() -> Bool {
       if let notificationSetting = UIApplication.shared.currentUserNotificationSettings {
           if notificationSetting.types.isEmpty {
               return false
           }
           return true
       }
       return false
   }
}
