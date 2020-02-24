//
//  InfoHud.swift
//  iTunesTest
//
//  Created by Rodrigo Astorga on 7/9/19.
//  Copyright © 2019 rastorga. All rights reserved.
//
import UIKit

public enum InfoHudWidth: CGFloat {
    case square = 112, extended = 129
}

public class InfoHud: UIView {

    @IBOutlet weak var text: UILabel!
    
    public static func show(_ viewController: UIViewController, text: String?, width: InfoHudWidth = .square, duration: TimeInterval = 2.5, completion: (() -> Void)? = nil) {
        
        let view = UINib.instantiate(nibWithClass: InfoHud.self)
        view.text.text = text

        view.alpha = 0
        let window: Any? = UIApplication.shared.delegate?.window as Any
        if let window = window as? UIWindow {
            var height = viewController.topbarHeight
            if height < 50 {
                height = 50
            }
            view.frame = CGRect(x: 0, y: 0, width: window.frame.size.width, height: height)
            window.addSubview(view)
            UIView.animate(withDuration: 0.6, animations: {
                view.alpha = 1
            }, completion: { (_) in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration, execute: {
                    UIView.animate(withDuration: 0.4, animations: {
                        view.alpha = 0
                    }, completion: { (_) in
                        view.removeFromSuperview()
                        completion?()
                    })
                })
            })
        }
    }
}

extension UINib {
    static func instantiate<ViewType: UIView>(nibWithClass viewClass: ViewType.Type) -> ViewType {
        return UINib(nibName: String(describing: viewClass), bundle: nil).instantiate(withOwner: nil, options: nil).first as! ViewType
    }
}
