//
//  ScreenshotManager.swift
//  Tutorial
//
//  Created by HF's Macbook on 9/18/20.
//  Copyright © 2020 CodeJunkie. All rights reserved.
//

import Foundation
import UIKit

protocol ScreenshotCaptureDelegate{
    func didTakeScreenshot()
}

let sharedPeripheralManager = ScreenshotManager.shared()

class ScreenshotManager: NSObject {
    
    var delegate: ScreenshotCaptureDelegate?
    
    var captureCount: Int = 0
    
    private static var sharedScreenshotManager : ScreenshotManager = {
        let peripheralManager = ScreenshotManager()
        return peripheralManager
    }()
    private override init() {
        super.init()
        print("Initialized...")
        UIScreen.main.addObserver(self, forKeyPath: "captured", options: .new, context: nil)
        
        let mainQueue = OperationQueue.main
        NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: mainQueue) { notification in
             print("Captured")
            self.capture()
        }
    }
    
    class func shared() -> ScreenshotManager{
        return sharedScreenshotManager
    }
    
    func capture(){
        // Here is the logic where we detect the capture !
        delegate?.didTakeScreenshot()
        
    }
}

