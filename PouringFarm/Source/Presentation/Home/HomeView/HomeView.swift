//
//  HomeView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/23/25.
//

import UIKit
import SnapKit

final class HomeView: UIView, BaseView {
    
    let bubbleView = HomeBubbleView()
    let pouringImage: BaseUIImageView
    private let nameStackView = UIStackView()
    let pouringName = BaseUILabel(size: 15)
    let statusLabel = BaseUILabel(size: 15)
    let babTextfield = BaseUITextfield(placeholder: "밥줘링")
    private let babDivider = UIView()
    let babButton: BaseConfigurationButton
    let waterTextfield = BaseUITextfield(placeholder: "물줘링")
    private let waterDivider = UIView()
    let waterButton: BaseConfigurationButton
    
    override init(frame: CGRect) {
        
        pouringImage = BaseUIImageView(PouringName.imageName(PouringName.반짝푸링.rawValue, 1))
        babButton = BaseConfigurationButton(buttonImage: SymbolImage.밥.img, buttonTitle: "밥먹기")
        waterButton = BaseConfigurationButton(buttonImage: SymbolImage.물.img, buttonTitle: "물먹기")
        
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameStackView.strokeCornerRadius()
    }
    
    func configureHierarchy() {
        [bubbleView, pouringImage, nameStackView, statusLabel, babTextfield, babDivider, babButton, waterTextfield, waterDivider, waterButton].forEach {
            self.addSubview($0)
        }
        
        nameStackView.addArrangedSubview(pouringName)
        
    }
    
    func configureLayout() {
        bubbleView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(50)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(UIScreen.main.bounds.width * 0.38)
        }
        
        pouringImage.snp.makeConstraints {
            $0.size.equalTo(UIScreen.main.bounds.width * 0.6)
            $0.top.equalTo(bubbleView.snp.bottom).offset(5)
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
        }
        
        nameStackView.snp.makeConstraints {
            $0.top.equalTo(pouringImage.snp.bottom).offset(8)
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
            $0.width.lessThanOrEqualTo(UIScreen.main.bounds.width * 0.6)
        }
        
        statusLabel.snp.makeConstraints {
            $0.top.equalTo(nameStackView.snp.bottom).offset(10)
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
        }
        
        babButton.snp.makeConstraints {
            $0.trailing.equalTo(pouringImage.snp.trailing)
            $0.top.equalTo(statusLabel.snp.bottom).offset(30)
        }
        
        babTextfield.snp.makeConstraints {
            $0.leading.equalTo(pouringImage.snp.leading)
            $0.trailing.equalTo(babButton.snp.leading).offset(-10)
            $0.firstBaseline.equalTo(babButton.snp_firstBaseline)
        }
        
        babDivider.snp.makeConstraints {
            $0.leading.equalTo(babTextfield.snp.leading)
            $0.trailing.equalTo(babTextfield.snp.trailing)
            $0.bottom.equalTo(babButton.snp.bottom)
            $0.height.equalTo(1)
        }
        
        waterButton.snp.makeConstraints {
            $0.trailing.equalTo(pouringImage.snp.trailing)
            $0.top.equalTo(babButton.snp.bottom).offset(12)
        }
        
        waterTextfield.snp.makeConstraints {
            $0.leading.equalTo(pouringImage.snp.leading)
            $0.trailing.equalTo(waterButton.snp.leading).offset(-10)
            $0.firstBaseline.equalTo(waterButton.snp_firstBaseline)
        }
        
        waterDivider.snp.makeConstraints {
            $0.leading.equalTo(waterTextfield.snp.leading)
            $0.trailing.equalTo(waterTextfield.snp.trailing)
            $0.bottom.equalTo(waterButton.snp.bottom)
            $0.height.equalTo(1)
        }
    }
    
    func configureView() {
        
        babDivider.backgroundColor = .prMain
        waterDivider.backgroundColor = .prMain
        
        pouringName.text = PouringName.반짝푸링.rawValue
        statusLabel.text = "현재 레벨/밥/물의 갯수"
        
        let stackSpacing: CGFloat = 6
        nameStackView.isLayoutMarginsRelativeArrangement = true
        nameStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: stackSpacing, leading: stackSpacing, bottom: stackSpacing, trailing: stackSpacing)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
