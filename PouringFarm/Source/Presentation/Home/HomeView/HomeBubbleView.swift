//
//  HomeBubbleView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/23/25.
//

import UIKit
import SnapKit

final class HomeBubbleView: UIView, BaseView {
    
    private let bubbleImage: BaseUIImageView
    let commentLabel: BaseUILabel
    
    override init(frame: CGRect) {
        
        bubbleImage = BaseUIImageView("bubble")
        commentLabel = BaseUILabel(size: 14, weight: .semibold, line: 0)
        
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        self.addSubview(bubbleImage)
        self.addSubview(commentLabel)
    }
    
    func configureLayout() {
        bubbleImage.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalTo(UIScreen.main.bounds.width * 0.6)
            $0.height.equalTo(UIScreen.main.bounds.width * 0.38)
        }
        
        commentLabel.snp.makeConstraints {
            $0.center.equalTo(bubbleImage)
            $0.width.lessThanOrEqualTo(UIScreen.main.bounds.width * 0.48)
            $0.height.lessThanOrEqualTo(bubbleImage.snp.height)
        }
    }
    
    func configureView() {
        commentLabel.text = RandomComment.set(SavingInfo.daejang)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
