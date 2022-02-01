//
//  QRCodeScannerView+Delegate.swift
//  QRCodeScanner
//
//  Created by Bhaskar on 26/11/21.
//

import AVFoundation

extension QRCodeScannerView: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let captureSession = captureSession else {
            return
        }
        captureSession.stopRunning()
        if let metadataObjects = metadataObjects.first {
            guard let readableObject = metadataObjects as? AVMetadataMachineReadableCodeObject else { return }
            guard let readableString = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            print(readableString)
            delegate?.qrCodeScanndingSucceeded(with: readableString)
        }
    }
}
