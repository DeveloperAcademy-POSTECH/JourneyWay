//
//  Sounds.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/11.
//

import UIKit
import AVFoundation

struct Sound {
    static var player:AVAudioPlayer?
    
    static func preparePlay(soundfile: String?) -> AVAudioPlayer? {
        if let soundfile = soundfile {
            guard let audioData = NSDataAsset(name: soundfile)?.data else {
                fatalError("Unable to find asset \(soundfile)")
                
            }
            do {
                player = try AVAudioPlayer(data: audioData)
                player?.prepareToPlay()
            } catch {
                print("Error")
            }
            
            return player
        }
        return nil
    }
}
