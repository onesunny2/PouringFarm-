//
//  UIView+Extension.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

extension UIView {
    
    func cornerRadius(_ radius: CGFloat = 5) {
        backgroundColor = .prBackground
        layer.cornerRadius = radius
        layer.borderColor = UIColor.prMain.cgColor
        layer.borderWidth = 1
        
        clipsToBounds = true
    }
}
