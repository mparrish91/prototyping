//
//  CustomCollectionViewCell.swift
//  WordiePrototyping
//
//  Created by parry on 11/19/16.
//  Copyright © 2016 parry. All rights reserved.
//

import UIKit
import AVFoundation

class CustomCollectionViewCell: UICollectionViewCell {
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?

    
    @IBOutlet weak var photoImageView: UIImageView!
    
}
