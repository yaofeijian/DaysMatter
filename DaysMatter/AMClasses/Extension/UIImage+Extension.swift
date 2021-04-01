//
//  UIImage+Extension.swift
//  yyTools
//
//  Created by hj on 2019/3/2.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit
import Photos

extension UIImage {
    open func tint(color: UIColor) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0);
        //画笔沾取颜色
        color.setFill()
        
        let bounds = CGRect.init(x: 0, y: 0, width: size.width, height: size.height);
        UIRectFill(bounds);
        //绘制一次
        self.draw(in: bounds, blendMode: .overlay, alpha: 1.0)
        //再绘制一次
        self.draw(in: bounds, blendMode: .destinationIn, alpha: 1.0)
        //获取图片
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
        
    }
    
    open class func color(_ color:UIColor, size:CGSize) -> UIImage? {
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        var image:UIImage?
        if let context = context {
            context.setFillColor(color.cgColor)
            context.fill(rect)
            image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
    open class func save(image: UIImage?, complete: @escaping (_ success:Bool) -> Void = {
        success in
        return
        }) {
        let status = PHPhotoLibrary.authorizationStatus()
        if let image = image {
            if status == .notDetermined {
                PHPhotoLibrary.requestAuthorization({ (status) in
                    if status == .authorized {
                        PHPhotoLibrary.shared().performChanges({
                            let _ = PHAssetChangeRequest.creationRequestForAsset(from: image)
                        }) { (success, error) in
                            DispatchQueue.main.async {
                                complete(success)
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            AMUtils.showNoPermissionAlertMessage(permission: "麦克风".l)
                            complete(false)
                        }
                    }
                })
            } else if status == .authorized {
                PHPhotoLibrary.shared().performChanges({
                    let _ = PHAssetChangeRequest.creationRequestForAsset(from: image)
                }) { (success, error) in
                    DispatchQueue.main.async {
                        complete(success)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    AMUtils.showNoPermissionAlertMessage(permission: "麦克风".l)
                    complete(false)
                }
            }
        } else {
            complete(false)
        }
    }
}
