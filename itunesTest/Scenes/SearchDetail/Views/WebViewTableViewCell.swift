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
    @IBOutlet weak var progressBar: UIProgressView!
    
    var myContext = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        webView.uiDelegate = self
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: &myContext)
    }
    
//    func webViewIsLoading() -> Bool {
//        return webView.isLoading
//    }
//    
//    func updateProgressBar() {
//        while(webView.isLoading) {
//            progressBar.progress = Float(webView.estimatedProgress / 1.0)
//        }
//        progressBar.isHidden = true
//                    
//        //            while(webView.estimatedProgress < 1.0) {
//        //                let estimated = Float(webView.estimatedProgress)
//        //                progressBar.setProgress(estimated, animated: true)
//        //            }
//        //            progressBar.isHidden = true
//    }
    
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
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let change = change else { return }
        if context != &myContext {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }

        if keyPath == "estimatedProgress" {
            if let progress = (change[NSKeyValueChangeKey.newKey] as AnyObject).floatValue {
                progressBar.progress = progress
                if progress == 1.0 {
                    progressBar.isHidden = true
                }
            }
            return
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
