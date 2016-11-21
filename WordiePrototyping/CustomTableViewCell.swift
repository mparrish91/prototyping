//
//  CustomTableViewCell.swift
//  WordiePrototyping
//
//  Created by parry on 11/20/16.
//  Copyright © 2016 parry. All rights reserved.
//

import UIKit
import AVFoundation

class CustomTableViewCell: UITableViewCell {

    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func playVideo() {
        if let plyr = player {
            plyr.actionAtItemEnd = .none
            plyr.play()
        }


    }
    
    func pauseVideo() {
        if let plyr = player {
            plyr.actionAtItemEnd = .none
            plyr.pause()
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
