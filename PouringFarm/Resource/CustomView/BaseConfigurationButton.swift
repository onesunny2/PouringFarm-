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
        
        var config = UIButton.Configuration.filled()
        config.image = buttonImage
        config.title = buttonTitle
        config.baseBackgroundColor = .prBackground
        config.baseForegroundColor = .prMain
        config.cornerStyle = .medium
        config.background.strokeColor = .prMain
        config.background.strokeWidth = 1
        config.imagePadding = 2
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
