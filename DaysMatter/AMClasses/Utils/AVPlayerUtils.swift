//
//  AVPlayerUtils.swift
//  YYTools
//
//  Created by eric on 2019/12/18.
//  Copyright © 2019 yy. All rights reserved.
//

import UIKit
import AVFoundation

///播放声音类型
enum ButtonSoundStyle {
    case normal     ///普通按钮音效
    case `switch`   ///切换按钮音效
    case countUp    ///计数增加
    case countDown  ///计数减少
    case refresh    ///刷新
}


class AVPlayerUtils : NSObject {
    private var player: AVAudioPlayer?
    private static let `default`:AVPlayerUtils = AVPlayerUtils()
    
    private override init() {
        super.init()
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.ambient)
    }
    
    static func play(_ style : ButtonSoundStyle = .normal) {
        let utils = AVPlayerUtils.default
        
        let path = Bundle.main.path(forResource: "Resource", ofType: "bundle")
        guard let resourcePath = path else { return }
        
        let bundle = Bundle.init(path: resourcePath)
        guard let resouceBundle = bundle else { return }
        
        var soundPath : String?
        switch style {
        case .normal:
            soundPath = resouceBundle.path(forResource: "sound/button_normal", ofType: "wav")
        case .switch:
            soundPath = resouceBundle.path(forResource: "sound/button_switch", ofType: "wav")
        case .countUp:
            soundPath = resouceBundle.path(forResource: "sound/button_count_up", ofType: "wav")
        case .countDown:
            soundPath = resouceBundle.path(forResource: "sound/button_count_down", ofType: "wav")
        case .refresh:
            soundPath = resouceBundle.path(forResource: "sound/button_refresh", ofType: "wav")
        }
        
        guard let targetSoundPath = soundPath else { return }
        
        do {
            utils.player = try AVAudioPlayer(
                contentsOf: NSURL.fileURL(withPath: targetSoundPath))
            // 重複播放次數 設為 0 則是只播放一次 不重複
            utils.player?.numberOfLoops = 0
            utils.player?.play()
            
        } catch {
            print("error")
        }
    }
    
    
    
}
