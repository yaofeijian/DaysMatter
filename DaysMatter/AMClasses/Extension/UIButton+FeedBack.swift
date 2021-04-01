//
//  UIButton+Sound.swift
//  YYTools
//
//  Created by eric on 2019/12/18.
//  Copyright © 2019 yy. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit


protocol ButtonFeedBackProtocol {
    
}

//fileprivate var playerKey = 100
extension ButtonFeedBackProtocol where Self : UIButton {
//    var player: AVAudioPlayer? {
//        set {
//            objc_setAssociatedObject(self, &playerKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        get {
//            return objc_getAssociatedObject(self, &playerKey) as? AVAudioPlayer
//        }
//    }
    
//    mutating func play(style : ButtonSoundStyle = .normal) {
//        let path = Bundle.main.path(forResource: "Resource", ofType: "bundle")
//        guard let resourcePath = path else { return }
//        let bundle = Bundle.init(path: resourcePath)
//
//        guard let resouceBundle = bundle else { return }
//
//        var soundPath : String?
//        switch style {
//        case .normal:
//            soundPath = resouceBundle.path(forResource: "sound/normal", ofType: "wav")
//        case .switch:
//            soundPath = resouceBundle.path(forResource: "sound/switch", ofType: "wav")
//        case .countUp:
//            soundPath = resouceBundle.path(forResource: "sound/count_up", ofType: "wav")
//        case .countDown:
//            soundPath = resouceBundle.path(forResource: "sound/count_down", ofType: "wav")
//        }
//
//        guard let targetSoundPath = soundPath else { return }
//
//        //        //建立的SystemSoundID对象
//        //        var soundID:SystemSoundID = 0
//        //        //地址转换
//        //        let baseURL = NSURL(fileURLWithPath: targetSoundPath)
//        //        //赋值
//        //        AudioServicesCreateSystemSoundID(baseURL, &soundID)
//        //        //播放声音
//        //        AudioServicesPlaySystemSound(soundID)
//        //        AudioServicesPlayAlertSound(soundID)
//        //        //建立的SystemSoundID对象
//        //        let feedBackSoundID = SystemSoundID(kSystemSoundID_Vibrate)
//        //        //振动
//        //        AudioServicesPlaySystemSound(feedBackSoundID)
//        do {
//            player = try AVAudioPlayer(
//                contentsOf: NSURL.fileURL(withPath: targetSoundPath))
//            // 重複播放次數 設為 0 則是只播放一次 不重複
//            player?.numberOfLoops = 0
//            player?.play()
//
//        } catch {
//            print("error")
//        }
//
//    }
    
    func play(_ style : ButtonSoundStyle = .normal) {
        AVPlayerUtils.play(style)
    }
    func impactOccurred(_ style:ButtonFeedBackStyle = .medium) {
        UIImpactFeedbackGeneratorUtils.impactOccurred(style)
    }
}

extension UIButton : ButtonFeedBackProtocol {
    
}
