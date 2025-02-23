//
//  BaseConfigurationButton.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/23/25.
//

import UIKit

final class BaseConfigurationButton: UIButton {
    
    init(buttonImage: UIImage, buttonTitle: String) {
        super.init(frame: .zero)
        
        let inset: CGFloat = 6
        
        let container = AttributeContainer().font(.systemFont(ofSize: 15, weight: .semibold))
        let attributedTitle = AttributedString(buttonTitle, attributes: container)
        
        var config = UIButton.Configuration.filled()
        config.image = buttonImage
        config.attributedTitle = attributedTitle
        config.baseBackgroundColor = .prBackground
        config.baseForegroundColor = .prMain
        config.cornerStyle = .medium
        config.background.strokeColor = .prMain
        config.background.strokeWidth = 1
        config.imagePadding = 2
        config.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        configuration = config
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
