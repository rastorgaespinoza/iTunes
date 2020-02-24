//
//  UIViewControllerExtension.swift
//  iTunesTest
//
//  Created by Rodrigo Astorga on 7/9/19.
//  Copyright © 2019 rastorga. All rights reserved.
//

import UIKit

private var loaderFlag = false

extension UIViewController {
    class func makeFromNib() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
    
    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    var loaderTag: Int {
        return 200
    }
    
    func stopLoading() {
        for subview in self.view.subviews{
            if let activityIndicator = subview as? UIActivityIndicatorView, activityIndicator.tag == loaderTag{
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
        //        self.view.alpha = 1.0
        self.view.isUserInteractionEnabled = true
        loaderFlag = false
    }
    
    var isLoaderActive: Bool {
        return loaderFlag
    }
}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        //        spinnerView.backgroundColor
        spinnerView.backgroundColor =  UIColor.init(red: 242/255, green: 242/255, blue: 242/255, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .white)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}

