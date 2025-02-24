//
//  SettingTableViewCell.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import UIKit

final class SettingTableViewCell: UITableViewCell {

    static let id = "SettingTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
 
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
