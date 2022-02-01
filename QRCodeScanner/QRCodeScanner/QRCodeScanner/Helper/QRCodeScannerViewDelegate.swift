//
//  QRCodeScannerViewDelegate.swift
//  QRCodeScanner
//
//  Created by Bhaskar on 26/11/21.
//
protocol QRCodeScannerViewDelegate: AnyObject {
    func qrCodeScanningDidFail()
    func qrCodeScanndingSucceeded(with info: String)
    func qrCodeScanningDidStop()
}
