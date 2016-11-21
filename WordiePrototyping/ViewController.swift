//
//  ViewController.swift
//  WordiePrototyping
//
//  Created by parry on 11/19/16.
//  Copyright © 2016 parry. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var customTableView: UITableView!

    @IBOutlet weak var lineMenuLine: UIView!
    var lastPlayingCell:CustomTableViewCell?

    let imageArray = ["1","2","3","4"]
//    let videoArray = ["https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/22.mp4?alt=media&token=200759f4-e1a5-45a5-b41d-77fe70121514", "https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/Black%20Ferrari%20Enzo%20with%20Tubi%20Exhaust%20-%20LOUD%20Acceleration.mp4?alt=media&token=e1793e30-8586-4208-9394-234f53ef9df0", "https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/DMC%20Lamborghini%20Aventador%20Molto%20Veloce%20Video%20Teaser.mp4?alt=media&token=a12b68d9-a0ca-4f07-abbe-cd64aba1e5b6"]
    
    let videoArray = ["https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/IMG_4558.MOV.mov?alt=media&token=6b860995-c0aa-4b4a-a869-bacb72dba477", "https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/IMG_4559.MOV.mov?alt=media&token=1c472a5a-6f03-4658-ba92-c986224d2457", "https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/IMG_4560.MOV.mov?alt=media&token=40f9f907-7435-4cc7-b66d-aa90c777974a"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bringSubview(toFront: lineMenuLine)
        
    }
    

    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
////        let videoURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//        
//        let player = AVPlayer(url: videoURL! as URL)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.frame
////        playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
//
//        self.view.layer.addSublayer(playerLayer)
//        player.play()
//    }



    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let videoURL = URL(string:videoArray[indexPath.row])
        cell.player = AVPlayer(url: videoURL!)
        cell.playerLayer = AVPlayerLayer(player: cell.player)

        
        if let pL = cell.playerLayer {
            pL.frame = self.view.frame

            cell.contentView.layer.addSublayer(pL)
            
            if let player = cell.player {
                player.actionAtItemEnd = .none

                //play first cell
                if indexPath.row == 0 {
                    player.play()

                }
            }
        }
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customTableView.frame.height
    }

    

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity:
        CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //find next page based on scroll
        let pageHeight = customTableView.bounds.size.height
        let videoLength = CGFloat(videoArray.count)
        
        let minSpace:CGFloat = 10
        
        var cellToSwipe = (scrollView.contentOffset.y) / (pageHeight + minSpace) + 0.5
        if cellToSwipe < 0 {
            cellToSwipe = 0
        }
        else if (cellToSwipe >= videoLength){
            cellToSwipe = videoLength - 1
        }
        let page = round(Double(Int(cellToSwipe)))
    let tabBarHeight = self.tabBarController?.tabBar.frame.height
    let y = (CGFloat(page) * customTableView.frame.size.height) + tabBarHeight! + 20
        
    let finalY = CGFloat(page) * y
        
        // set custom offset

    targetContentOffset.pointee.y = finalY
        
        
        
        
        // Play/Pause Video
        let visibleRect = CGRect(origin: customTableView.contentOffset, size: customTableView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = customTableView.indexPathForRow(at: visiblePoint)
        
        let cell = customTableView.cellForRow(at: visibleIndexPath!) as! CustomTableViewCell
        
        
        if (cell != self.lastPlayingCell) {
            
            self.lastPlayingCell?.pauseVideo()
            self.lastPlayingCell = cell
            cell.playVideo()
        }
        
    }


 
}

