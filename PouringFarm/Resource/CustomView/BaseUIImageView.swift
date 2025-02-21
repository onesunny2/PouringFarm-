//
//  BaseUIImageView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

final class BaseUIImageView: UIImageView {
    
    init(_ imgName: String) {
        super.init(frame: .zero)
        
        self.image = UIImage(named: imgName)
        self.contentMode = .scaleAspectFit
        self.backgroundColor = .clear
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
