//
//  DocumentView.swift
//  slim-film
//
//  Created by Amer Abboud on 3/7/21.
//

import UIKit
import WebKit

class DocumentViewerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(url: URL) {
        super.init(nibName: nil, bundle: nil)
        let webView = WKWebView(frame: view.frame)
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        view.addSubview(webView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
