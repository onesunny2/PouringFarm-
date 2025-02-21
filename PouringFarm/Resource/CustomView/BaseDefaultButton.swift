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
        
        setTitle(title, for: .normal)
        setTitleColor(.prMain, for: .normal)
        backgroundColor = bgColor
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
