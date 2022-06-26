//
//  LoadingCircle.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/26.
//

import Foundation
import UIKit
import SnapKit

class LoadingCircle {
    static let sharedInstance = LoadingCircle()
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(frame:
                                                        CGRect(x: 0,
                                                               y: 0,
                                                               width: 100,
                                                               height: 100))
        indicatorView.color = UIColor.white
        indicatorView.style = UIActivityIndicatorView.Style.large
        indicatorView.hidesWhenStopped = true
        indicatorView.startAnimating()
        return indicatorView
    }()
    
    func setUpActivityIndicator() {
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func topViewController() -> UIViewController? {
        var vc = UIApplication.shared.keyWindow?.rootViewController
        while vc?.presentedViewController != nil {
            vc = vc?.presentedViewController
        }
        return vc
    }
    
    func showIndicator() {
        let vc = topViewController()
        vc?.view.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        setUpActivityIndicator()
    }
    
    func stopIndicator() {
        view.removeFromSuperview()
    }
}
