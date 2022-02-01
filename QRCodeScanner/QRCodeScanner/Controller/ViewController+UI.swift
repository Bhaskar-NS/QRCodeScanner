//
//  ViewController+UI.swift
//  QRCodeScanner
//
//  Created by Bhaskar on 26/11/21.
//

import UIKit
extension ViewController {
    func setup() {
        view.backgroundColor = .black
        setupScannerView()
        setupActionButton()
    }
    
    private func setupScannerView() {
        view.addSubview(qrCodeScanner)
        qrCodeScanner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        qrCodeScanner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        qrCodeScanner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        qrCodeScanner.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.5).isActive = true
    }
    
    private func setupActionButton() {
        view.addSubview(actionButton)
        actionButton.topAnchor.constraint(equalTo: qrCodeScanner.bottomAnchor, constant: 24).isActive = true
        actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
