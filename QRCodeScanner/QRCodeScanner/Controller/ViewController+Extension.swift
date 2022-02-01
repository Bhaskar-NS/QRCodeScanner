//
//  ViewController+Extension.swift
//  QRCodeScanner
//
//  Created by Bhaskar on 26/11/21.
//

import Foundation

extension ViewController: QRCodeScannerViewDelegate {
    func qrCodeScanningDidFail() {
        print("qrCodeScanningDidFail")
    }
    
    func qrCodeScanndingSucceeded(with info: String) {
        print("qrCodeScanndingSucceeded \(info)")
    }
    
    func qrCodeScanningDidStop() {
        print("qrCodeScanningDidStop")
    }
}
