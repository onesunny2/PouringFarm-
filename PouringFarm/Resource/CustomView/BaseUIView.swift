//
//  BaseUIView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

final class BaseUIView: UIView {
    
    init(_ radius: CGFloat = 5) {
        super.init(frame: .zero)
        
        backgroundColor = .prBackground
        layer.cornerRadius = radius
        layer.borderColor = UIColor.prMain.cgColor
        layer.borderWidth = 1
        
        clipsToBounds = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
