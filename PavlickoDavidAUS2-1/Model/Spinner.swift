//
//  Spinner.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 18/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class Spinner {
    
    class func purpleBackground(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = AppDelegate.shared.junoBlue.withAlphaComponent(0.1)
        
        UIView.animate(withDuration: 5, animations: { () -> Void in
            spinnerView.backgroundColor = AppDelegate.shared.friPurple
        })
        
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func normalGray(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        
        let ai = UIActivityIndicatorView.init(style: .medium)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func normalBig(onView : UIView, color: UIColor) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.color = color
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
