//
//  QRCodeScannerView.swift
//  QRCodeScanner
//
//  Created by Bhaskar on 26/11/21.
//

import UIKit
import AVFoundation

class QRCodeScannerView: UIView {
    
    weak var delegate: QRCodeScannerViewDelegate?
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?
//    var scanner: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Failed to Initialise")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let previewLayer = previewLayer else {
            return
        }
        previewLayer.frame = self.bounds
        previewLayer.videoGravity = .resizeAspectFill
    }
}
