//
//  MainViewController.swift
//  slim-film
//
//  Created by Amer Abboud on 3/7/21.
//

import UIKit
import MobileCoreServices
import WebKit

class MainVC: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Slim-Film"
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let filesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open another file", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(filesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        filesButtonTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(filesButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            filesButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 48),
            filesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            filesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            filesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func filesButtonTapped() {
        let types: [String] = [String(kUTTypeItem)]
        let documentPickerVC = UIDocumentPickerViewController(documentTypes: types, in: .import)
        documentPickerVC.delegate = self
        present(documentPickerVC, animated: true)
    }
}

extension MainVC: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else { return }
        let documentViewerVC = DocumentViewerVC(url: url)
        present(documentViewerVC, animated: true)
    }
}

