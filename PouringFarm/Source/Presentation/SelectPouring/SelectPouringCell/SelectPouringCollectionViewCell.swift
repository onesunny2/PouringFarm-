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
    private let stackView = UIStackView()
    private let pouringName = BaseUILabel()
    
    override init(frame: CGRect) {
        
        pouringImage = BaseUIImageView("noImage")
        
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        [pouringImage, stackView].forEach {
            contentView.addSubview($0)
        }
        stackView.addArrangedSubview(pouringName)
    }
    
    func configureLayout() {
        pouringImage.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(self.frame.width)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(pouringImage.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.width.lessThanOrEqualTo(self.frame.width)
        }

        let stackSpacing: CGFloat = 6
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: stackSpacing, leading: stackSpacing, bottom: stackSpacing, trailing: stackSpacing)
    }
    
    func configureView() {
        backgroundColor = .clear
        
        pouringName.text = "헤실헤실 푸링이"
    }
    
    func configureCell() {

        stackView.strokeCornerRadius()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
