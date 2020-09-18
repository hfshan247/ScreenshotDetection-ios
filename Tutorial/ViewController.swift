//
//  ViewController.swift
//  Tutorial
//
//  Created by HF's Macbook on 9/18/20.
//  Copyright © 2020 CodeJunkie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sharedPeripheralManager.delegate = self
    }
    
}

extension ViewController: ScreenshotCaptureDelegate{
    func didTakeScreenshot(captureCount: Int) {
        let alert = UIAlertController(title: "Alert", message: "Screenshot was captured \(captureCount) times", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
