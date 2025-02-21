//
//  BaseUILabel.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit
import SnapKit

final class BaseUILabel: UILabel {

    init(size: CGFloat = 15, weight: UIFont.Weight = .semibold, line: Int = 1) {
        super.init(frame: .zero)
        
        self.textColor = .prMain
        self.font = .systemFont(ofSize: size, weight: weight)
        self.textAlignment = .center
        self.numberOfLines = line
    }
 
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
