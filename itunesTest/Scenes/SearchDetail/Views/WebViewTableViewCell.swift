//
//  WebViewTableViewCell.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 23-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit
import WebKit

class WebViewTableViewCell: UITableViewCell {
    @IBOutlet weak var webView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            let myURL = viewModel.url
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
    }

}

extension WebViewTableViewCell {
    struct ViewModel {
        let url: URL
    }
}

extension WebViewTableViewCell: WKUIDelegate {
    
}
