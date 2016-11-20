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

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    @IBOutlet weak var customCollectionView: UICollectionView!


    let imageArray = ["1","2","3","4"]
//    let videoArray = ["https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/22.mp4?alt=media&token=200759f4-e1a5-45a5-b41d-77fe70121514", "https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/Black%20Ferrari%20Enzo%20with%20Tubi%20Exhaust%20-%20LOUD%20Acceleration.mp4?alt=media&token=e1793e30-8586-4208-9394-234f53ef9df0", "https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/DMC%20Lamborghini%20Aventador%20Molto%20Veloce%20Video%20Teaser.mp4?alt=media&token=a12b68d9-a0ca-4f07-abbe-cd64aba1e5b6"]
    
    let videoArray = ["https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/IMG_4558.MOV.mov?alt=media&token=6b860995-c0aa-4b4a-a869-bacb72dba477", "https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/IMG_4559.MOV.mov?alt=media&token=1c472a5a-6f03-4658-ba92-c986224d2457", "https://firebasestorage.googleapis.com/v0/b/sixth-tempo-830.appspot.com/o/IMG_4560.MOV.mov?alt=media&token=40f9f907-7435-4cc7-b66d-aa90c777974a"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
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


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        let videoURL = URL(string:videoArray[indexPath.row])
        cell.player = AVPlayer(url: videoURL!)
        cell.playerLayer = AVPlayerLayer(player: cell.player)
        
        cell.backgroundColor = UIColor.yellow
        customCollectionView.backgroundColor = UIColor.red

        if let pL = cell.playerLayer {
            pL.frame = self.view.frame
            cell.contentView.layer.addSublayer(pL)
            
            if let player = cell.player {
                player.play()
            }
        }
     
        
//        if let playerItem = cell.player {
//            cell.player?.replaceCurrentItem(with: <#T##AVPlayerItem?#>)
//            
//        }
//        
        
//        cell.photoImageView.image = UIImage(named: imageArray[indexPath.row])   
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageHeight = customCollectionView.bounds.size.height
        let videoLength = CGFloat(videoArray.count)

        let minSpace:CGFloat = 10
        
        var cellToSwipe = (scrollView.contentOffset.y) / (pageHeight + minSpace) + 0.5
        if cellToSwipe < 0 {
            cellToSwipe = 0
        }
        else if (cellToSwipe >= videoLength){
            cellToSwipe = videoLength - 1
        }
        let p = Int(cellToSwipe)
        let roundedIP = round(Double(Int(cellToSwipe)))
        let ip = IndexPath(row: Int(roundedIP), section: 0)
        
//        let ip = IndexPath(row: 2, section: 0)
        view.layoutIfNeeded()
        customCollectionView.scrollToItem(at: ip, at: UICollectionViewScrollPosition.centeredVertically, animated: true)
        
        
    }


    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        
//        if let collectionView = customCollectionView {
//            
//            targetContentOffset.memory = scrollView.contentOffset
//            let pageWidth = CGRectGetWidth(scrollView.frame) + flowLayout.minimumInteritemSpacing
//            
//            var assistanceOffset : CGFloat = pageWidth / 3.0
//            
//            if velocity.x < 0 {
//                assistanceOffset = -assistanceOffset
//            }
//            
//            let assistedScrollPosition = (scrollView.contentOffset.x + assistanceOffset) / pageWidth
//            
//            var targetIndex = Int(round(assistedScrollPosition))
//            
//            
//            if targetIndex < 0 {
//                targetIndex = 0
//            }
//            else if targetIndex >= collectionView.numberOfItemsInSection(0) {
//                targetIndex = collectionView.numberOfItemsInSection(0) - 1
//            }
//            
//            print("targetIndex = \(targetIndex)")
//            
//            let indexPath = NSIndexPath(forItem: targetIndex, inSection: 0)
//            
//            collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: true)
//    }
//    

    
//    private func collectionView(collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        let size = CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
//        return size
//    }
//    
//    override func viewWillLayoutSubviews() {
//        customCollectionView.collectionViewLayout.invalidateLayout()
//    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let layout = customCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemWidth = view.frame.width
            let itemHeight = view.frame.height
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.invalidateLayout()
        }

        
//        let ip = IndexPath(row: 2, section: 0)
//        
//        view.layoutIfNeeded()
//        customCollectionView.scrollToItem(at: ip, at: UICollectionViewScrollPosition.centeredVertically, animated: true)
        
//        let point = CGPoint(x: 50, y: 600)
//        customCollectionView.setContentOffset(point, animated: true)

    }

}

