//
//  QRCodeScannerView+Setup.swift
//  QRCodeScanner
//
//  Created by Bhaskar on 26/11/21.
//
import AVFoundation
import UIKit

extension QRCodeScannerView {
    var isRunning: Bool {
        guard let captureSession = captureSession else {
            return false
        }
        return captureSession.isRunning
    }
    
    func startScanning() {
        guard let captureSession = captureSession else {
            return
        }
        captureSession.startRunning()
    }
    
    func stopScanning() {
        guard let captureSession = captureSession else {
            return
        }
        captureSession.stopRunning()
        delegate?.qrCodeScanningDidStop()
    }
    
    func setup() {
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            return
        }
        
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        guard let captureSession = captureSession else {
            return
        }
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            failToScanQrCode()
        }
        
        let metadataOutput: AVCaptureMetadataOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr, .ean8, .ean13, .pdf417]
        } else {
            failToScanQrCode()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        guard let previewLayer = previewLayer else {
            return
        }
        previewLayer.frame = layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(previewLayer)
        captureSession.startRunning()
    }
    
    func failToScanQrCode() {
        delegate?.qrCodeScanningDidFail()
    }
}
