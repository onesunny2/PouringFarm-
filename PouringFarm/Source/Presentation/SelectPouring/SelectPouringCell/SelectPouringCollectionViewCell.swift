//
//  SelectPouringCollectionViewCell.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit
import SnapKit

final class SelectPouringCollectionViewCell: UICollectionViewCell, BaseCell {

    static let id = "SelectPouringCollectionViewCell"
    
    private let pouringImage: BaseUIImageView
    private let pouringName = UILabel()
    
    override init(frame: CGRect) {
        
        pouringImage = BaseUIImageView("noImage")
        
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        contentView.addSubview(pouringImage)
    }
    
    func configureLayout() {
        pouringImage.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(self.frame.width)
        }
    }
    
    func configureView() {
        backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
