//
//  ViewController.swift
//  QRCodeScanner
//
//  Created by Bhaskar on 26/11/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var qrCodeScanner: QRCodeScannerView = {
        let view = QRCodeScannerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("STOP", for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if qrCodeScanner.isRunning == false {
            qrCodeScanner.startScanning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if qrCodeScanner.isRunning == true {
            qrCodeScanner.stopScanning()
        }
    }
    
    @objc func actionButtonTapped() {
        qrCodeScanner.isRunning ? qrCodeScanner.stopScanning() : qrCodeScanner.startScanning()
        actionButton.setTitle(qrCodeScanner.isRunning ? "STOP" : "SCAN", for: .normal)
    }
}
