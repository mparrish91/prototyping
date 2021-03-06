//
//  RecordViewController.swift
//  WordiePrototyping
//
//  Created by parry on 11/19/16.
//  Copyright © 2016 parry. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

//class RecordViewController: UIViewController, AVCaptureFileOutputRecordingDelegate {
//    
//    var delegate : AVCaptureFileOutputRecordingDelegate?
//    @IBOutlet var imageView : UIImageView
//    @IBOutlet var imagePreview : UIView
//    
//    var session : AVCaptureSession!
//    var fileOutput : AVCaptureMovieFileOutput!
//    var previewLayer : AVCaptureVideoPreviewLayer!
//    
//    func initCamera() -> Bool {
//        var cameraBack : AVCaptureDevice?
//        var videoIn : AVCaptureDeviceInput
//        
//        var devices : NSArray = AVCaptureDevice.devices()
//        for device: AnyObject in devices{
//            if device.position == AVCaptureDevicePosition.Back{
//                cameraBack = device as? AVCaptureDevice
//            }
//        }
//        delegate=self
//        var error : NSErrorPointer!
//        var deviceInput : AVCaptureInput =      AVCaptureDeviceInput.deviceInputWithDevice(cameraBack, error: error) as AVCaptureInput
//        
//        self.session=AVCaptureSession()
//        self.session.addInput(deviceInput as AVCaptureInput)
//        
//        self.fileOutput = AVCaptureMovieFileOutput()
//        self.session.addOutput(self.fileOutput)
//        var previewLayer: AVCaptureVideoPreviewLayer =     AVCaptureVideoPreviewLayer.layerWithSession(self.session) as AVCaptureVideoPreviewLayer
//        previewLayer.frame = self.imagePreview.bounds
//        self.imagePreview.layer.addSublayer(previewLayer)
//        
//        self.session.startRunning()
//        
//        return true
//    }
//    
//    
//    @IBAction func stop(sender : UIButton) {
//        println("Stop")
//        self.fileOutput.stopRecording()
//    }
//    
//    @IBAction func record(sender : UIButton) {
//        
//        var formatter: NSDateFormatter = NSDateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
//        let dateTimePrefix: String = formatter.stringFromDate(NSDate())
//        
//        let paths = NSSearchPathForDirectoriesInDomains(
//            .DocumentDirectory, .UserDomainMask, true)
//        
//        let documentsDirectory = paths[0] as String
//        
//        var filePath:String? = nil
//        var fileNamePostfix = 0
//        do {
//            filePath =
//            "\(documentsDirectory)/\(dateTimePrefix)-\(fileNamePostfix++).mp4"
//        } while (NSFileManager.defaultManager().fileExistsAtPath(filePath))
//        self.fileOutput.startRecordingToOutputFileURL(filePath, recordingDelegate: delegate)
//        
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            // Do any additional setup after loading the view, typically from a nib.
//            self.initCamera()
//        }
//        
//        
//        func captureOutput(captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAtURL outputFileURL: NSURL!, fromConnections connections: AnyObject[]!, error: NSError!){
//            recording=true
//        }
//        
//        func captureOutput(captureOutput: AVCaptureFileOutput!, didStartRecordingToOutputFileAtURL fileURL: NSURL!, fromConnections connections: AnyObject[]!) {
//            recording=false
//            
//}
