//
//  BaseDefaultButton.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

final class BaseDefaultButton: UIButton {
    
    init(_ title: String, bgColor: UIColor = .prBackground) {
        super.init(frame: .zero)
        
        let transformTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium)])
        
        setTitleColor(.prMain, for: .normal)
        setAttributedTitle(transformTitle, for: .normal)
        backgroundColor = bgColor
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
