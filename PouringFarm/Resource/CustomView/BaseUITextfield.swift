//
//  BaseUITextfield.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/23/25.
//

import UIKit

final class BaseUITextfield: UITextField {
    
    init(placeholder: String, alignment: NSTextAlignment = .center, keyboard: UIKeyboardType = .numberPad) {
        super.init(frame: .zero)
        
        let placeholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        textColor = .prMain
        textAlignment = alignment
        keyboardType = keyboard
        attributedPlaceholder = placeholder
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
