//
//  UIDevice+Extension.swift
//  yyTools
//
//  Created by 姚飞剑 on 2019/3/18.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit

extension UIDevice {
    private static var identifier: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    
    
    /// 设备ppi
    public static var ppi:CGFloat {
        guard let currentModelSize = UIScreen.main.currentMode?.size else {
            return 0
        }
        var inch:Float = 0
        
        switch UIDevice.identifier {
        case "iPhone4,1":
            inch = 3.5  //return@"iPhone 4S"
        case "iPhone5,1":
            inch = 4.0  //return@"iPhone 5"
        case "iPhone5,2":
            inch = 4.0  //return@"iPhone 5"
        case "iPhone5,3":
            inch = 4.0  //return@"iPhone 5c"
        case "iPhone5,4":
            inch = 4.0  //return@"iPhone 5c"
        case "iPhone6,1":
            inch = 4.0  //return@"iPhone 5s"
        case "iPhone6,2":
            inch = 4.0  //return@"iPhone 5s"
        case "iPhone7,1":
            return 401  //return@"iPhone 6 Plus"
        case "iPhone7,2":
            inch = 4.7  //return@"iPhone 6"
        case "iPhone8,1":
            inch = 4.7  //return@"iPhone 6s"
        case "iPhone8,2":
            return 401  //return@"iPhone 6s Plus"
        case "iPhone8,4":
            inch = 4.0  //return@"iPhone SE"
        case "iPhone9,1":
            inch = 4.7  //return@"iPhone 7"
        case "iPhone9,2":
            return 401  //return@"iPhone 7 Plus"
        case "iPhone9,4":
            return 401  //return@"iPhone 7 Plus"
        case "iPhone9,3":
            inch = 4.7  //return@"iPhone 7"
        case "iPhone10,1":
            inch = 4.7  //return@"iPhone 8"
        case "iPhone10,2":
            return 401  //return@"iPhone 8 Plus"
        case "iPhone10,3":
            inch = 5.8;//return@"iPhone X";
        case "iPhone10,4":
            inch = 4.7  //return@"iPhone 8"
        case "iPhone10,5":
            return 401  //return@"iPhone 8 Plus"
        case "iPhone10,6":
            inch = 5.8  //return@"iPhone X";
        case "iPhone11,2":
            inch = 5.8  //return@"iPhone XS";
        case "iPhone11,4":
            inch = 6.5  //return@"iPhone X Max";
        case "iPhone11,6":
            inch = 6.5  //return@"iPhone X Max";
        case "iPhone11,8":
            inch = 6.1  //326;//return@"iPhone XR";
        case "iPhone12,1":
            inch = 6.06  //return@"iPhone 11";
        case "iPhone12,3":
            inch = 5.85  //return@"iPhone 11 Pro";
        case "iPhone12,5":
            inch = 6.46  //return@"iPhone 11 Pro Max";
        case "iPad1,1":
            inch = 9.7;//return@"iPad 1G";
        case "iPad2,1":
            inch = 9.7;//return@"iPad 2";
        case "iPad2,2":
            inch = 9.7;//return@"iPad 2";
        case "iPad2,3":
            inch = 9.7;//return@"iPad 2";
        case "iPad2,4":
            inch = 9.7;//return@"iPad 2";
        case "iPad2,5":
            inch = 7.9;//return@"iPad Mini 1G";
        case "iPad2,6":
            inch = 7.9;//return@"iPad Mini 1G";
        case "iPad2,7":
            inch = 7.9;//return@"iPad Mini 1G";
        case "iPad3,1":
            inch = 9.7;//return@"iPad 3";
        case "iPad3,2":
            inch = 9.7;//return@"iPad 3";
        case "iPad3,3":
            inch = 9.7;//return@"iPad 3";
        case "iPad3,4":
            inch = 9.7;//return@"iPad 4";
        case "iPad3,5":
            inch = 9.7;//return@"iPad 4";
        case "iPad3,6":
            inch = 9.7;//return@"iPad 4";
        case "iPad4,1":
            inch = 9.7;//return@"iPad Air";
        case "iPad4,2":
            inch = 9.7;//return@"iPad Air";
        case "iPad4,3":
            inch = 9.7;//return@"iPad Air";
        case "iPad4,4":
            inch = 7.9;//return@"iPad Mini 2G";
        case "iPad4,5":
            inch = 7.9;//return@"iPad Mini 2G";
        case "iPad4,6":
            inch = 7.9;//return@"iPad Mini 2G";
        case "iPad4,7":
            inch = 7.9;//return@"iPad Mini 3";
        case "iPad4,8":
            inch = 7.9;//return@"iPad Mini 3";
        case "iPad4,9":
            inch = 7.9;//return@"iPad Mini 3";
        case "iPad5,1":
            inch = 7.9;//return@"iPad Mini 4";
        case "iPad5,2":
            inch = 7.9;//return@"iPad Mini 4";
        case "iPad5,3":
            inch = 9.7;//return@"iPad Air 2";
        case "iPad5,4":
            inch = 9.7;//return@"iPad Air 2";
        case "iPad6,3":
            inch = 9.7;//return@"iPad Pro 9.7";
        case "iPad6,4":
            inch = 9.7;//return@"iPad Pro 9.7"
        case "iPad6,7":
            inch = 12.9;//return@"iPad Pro 12.9";
        case "iPad6,8":
            inch = 12.9;//return@"iPad Pro 12.9";
        case "iPad6,11":
            inch = 9.7;//return@"iPad Pro 9.7"
        case "iPad6,12":
            inch = 9.7;//return@"iPad Pro 9.7";
        case "iPad7,1":
            inch = 12.9;
        case "iPad7,2":
            inch = 12.9;
        case "iPad7,3":
            inch = 10.5;
        case "iPad7,4":
            inch = 10.5;
        case "iPad7,5":
            inch = 9.7;
        case "iPad7,6":
            inch = 9.7;
        case "iPad8,1": //iPad Pro 11inch   2018.10.30
            inch = 11.0;
        case "iPad8,2":  //iPad Pro 11inch   2018.10.30
            inch = 11.0;
        case "iPad8,3": //iPad Pro 11inch   2018.10.30
            inch = 11.0;
        case "iPad8,4": //iPad Pro 11inch   2018.10.30
            inch = 11.0;
        case "iPad8,5": //iPad Pro 3nd 12.9inch 2018.10.30
            inch = 12.9;
        case "iPad8,6": //iPad Pro 3nd 12.9inch 2018.10.30
            inch = 12.9;
        case "iPad8,7": //iPad Pro 3nd 12.9inch 2018.10.30
            inch = 12.9;
        case "iPad8,8": //iPad Pro 3nd 12.9inch 2018.10.30
            inch = 12.9;
        case "iPad11,1":
            inch = 7.9;
        case "iPad11,2":
            inch = 7.9;
        case "iPad11,3":
            inch = 10.5;
        case "iPad11,4":
            inch = 10.5;
        case "iPad7,11":
            inch = 10.2;
        case "iPad7,12":
            inch = 10.2;
        case "iPod1,1":
            inch = 3.5;//return@"iPod Touch 1G";
        case "iPod2,1":
            inch = 3.5;//return@"iPod Touch 2G";
        case "iPod3,1":
            inch = 3.5;//return@"iPod Touch 3G";
        case "iPod4,1":
            inch = 3.5;//return@"iPod Touch 4G";
        case "iPod5,1":
            inch = 4.0;//return@"iPod Touch 5G";
        case "iPod7,1":
            inch = 4.0;//iPod touch (6th generation)
        case "i386":
            return 326;//return@"iPhone Simulator";
        case "x86_64":
            return 326;//return@"iPhone Simulator";
        default:
            inch = 0
        }
        if (inch == 0) {
            return 0;
        }
        
        let q = Float(currentModelSize.width*currentModelSize.width + currentModelSize.height*currentModelSize.height)
        let ppi =  (sqrtf(q))/inch;
        return CGFloat(ppi);
    }
    
    
    /// 是否plus
    public static var isPlus:Bool {
        switch UIDevice.identifier {
        case "iPhone7,1":
            return true
        case "iPhone8,2":
            return true
        case "iPhone9,2":
            return true
        case "iPhone9,4":
            return true
        case "iPhone10,2":
            return true
        case "iPhone10,5":
            return true
        default:
            return false
        }
    }
}
