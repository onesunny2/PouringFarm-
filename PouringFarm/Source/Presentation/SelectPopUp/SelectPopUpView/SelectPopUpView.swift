//
//  SelectPopUpView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit
import SnapKit

final class SelectPopUpView: UIView, BaseView {

    private let mainPopupView = UIView()
    let pouringImage: BaseUIImageView
    private let nameStackView = UIStackView()
    var pouringName = BaseUILabel()
    private let middleStackView = UIStackView()
    private let topDivider = UIView()
    let pouringIntro = BaseUILabel(size: 13, weight: .medium, line: 0)
    private let bottomDivider = UIView()
    private let buttonLine = UIView()
    let cancelButton = BaseDefaultButton("취소", bgColor: .prMain.withAlphaComponent(0.2))
    let startButton = BaseDefaultButton("시작하기")
    
    init(_ type: PouringName, _ level: Int) {
        
        pouringImage = BaseUIImageView(type.imageName(level))
        
        super.init(frame: .zero)
        
        pouringName.text = type.rawValue
        pouringIntro.text = type.introduction
        
        configureHierarchy()
        configureView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureLayout()
        mainPopupView.basicCornerRadius(10)
        nameStackView.strokeCornerRadius()
    }

    func configureHierarchy() {
        self.addSubview(mainPopupView)
        [pouringImage, nameStackView, middleStackView, buttonLine, cancelButton, startButton].forEach {
            mainPopupView.addSubview($0)
        }
        nameStackView.addArrangedSubview(pouringName)
        [topDivider, pouringIntro, bottomDivider].forEach {
            middleStackView.addArrangedSubview($0)
        }
    }
    
    func configureLayout() {

        let screen = UIScreen.main.bounds
        let mainWidth = screen.width * 0.7
        
        mainPopupView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(screen.height * 0.48)
            $0.width.equalTo(mainWidth)
        }
        
        pouringImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(50)
            $0.size.equalTo(screen.width * 0.3)
        }
        
        nameStackView.snp.makeConstraints {
            $0.top.equalTo(pouringImage.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
            $0.width.lessThanOrEqualTo(mainWidth)
        }
        
        middleStackView.snp.makeConstraints {
            $0.top.equalTo(nameStackView.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().inset(50)
            $0.width.lessThanOrEqualTo(mainWidth)
        }
        
        topDivider.snp.makeConstraints {
            $0.centerX.equalTo(mainPopupView)
            $0.width.equalTo(mainWidth * 0.75)
            $0.height.equalTo(1)
        }
        
        pouringIntro.snp.makeConstraints {
            $0.leading.equalTo(topDivider.snp.leading)
            $0.trailing.equalTo(topDivider.snp.trailing)
        }
        
        bottomDivider.snp.makeConstraints {
            $0.centerX.equalTo(mainPopupView)
            $0.width.equalTo(mainWidth)
            $0.height.equalTo(1)
        }
        
        buttonLine.snp.makeConstraints {
            $0.bottom.equalTo(middleStackView.snp.bottom)
            $0.height.equalTo(1)
            $0.horizontalEdges.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.top.equalTo(middleStackView.snp.bottom)
            $0.width.equalTo(mainWidth * 0.5)
        }
        
        startButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.top.equalTo(middleStackView.snp.bottom)
            $0.width.equalTo(mainWidth * 0.5)
        }
    }
    
    func configureView() {
        backgroundColor = .black.withAlphaComponent(0.5)
        
        mainPopupView.backgroundColor = .prBackground
        topDivider.backgroundColor = .prMain
        bottomDivider.backgroundColor = .clear
        buttonLine.backgroundColor = .prMain.withAlphaComponent(0.5)

        setNameStackView()
        setMiddleStackView()
    }
    
    private func setNameStackView() {
        let stackSpacing: CGFloat = 8
        nameStackView.isLayoutMarginsRelativeArrangement = true
        nameStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: stackSpacing, leading: stackSpacing, bottom: stackSpacing, trailing: stackSpacing)
    }
    
    private func setMiddleStackView() {
        middleStackView.axis = .vertical
        middleStackView.distribution = .equalSpacing
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


