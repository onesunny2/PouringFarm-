//
//  SelectPopUpView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit
import SnapKit

final class SelectPopUpView: UIView, BaseView {

    private let mainStackView = UIStackView()
    let pouringImage: BaseUIImageView
    private let nameStackView = UIStackView()
    let pouringName = BaseUILabel()
    private let middleStackView = UIStackView()
    let topDivider = UIView()
    let pouringIntro = BaseUILabel()
    let bottomDivider = UIView()
    let cancelButton = BaseDefaultButton("취소", bgColor: .prMain.withAlphaComponent(0.5))
    let startButton = BaseDefaultButton("시작하기")
    
    init(_ type: PouringName, _ level: Int) {
        
        pouringImage = BaseUIImageView(type.imageName(level))
        
        super.init(frame: .zero)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        addSubview(mainStackView)
        [pouringImage, nameStackView, middleStackView, cancelButton, startButton].forEach {
            mainStackView.addArrangedSubview($0)
        }
        nameStackView.addArrangedSubview(pouringName)
        [topDivider, pouringIntro, bottomDivider].forEach {
            middleStackView.addArrangedSubview($0)
        }
    }
    
    func configureLayout() {
        
        guard let screen = window?.windowScene?.screen.bounds else { return }
        
        mainStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(screen.height * 0.5)
            $0.width.equalTo(screen.width * 0.8)
        }
        
        pouringImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(45)
            $0.size.equalTo(screen.width * 0.3)
        }
        
        nameStackView.snp.makeConstraints {
            $0.top.equalTo(pouringImage.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.width.lessThanOrEqualTo(self.frame.width)
        }
        
        middleStackView.snp.makeConstraints {
            $0.top.equalTo(nameStackView.snp.bottom).offset(12)
            $0.bottom.equalToSuperview().inset(30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        topDivider.snp.makeConstraints {
            $0.width.equalTo(self.frame.width * 0.33)
            $0.height.equalTo(1)
        }
        
        pouringIntro.snp.makeConstraints {
            $0.leading.equalTo(topDivider.snp.leading)
            $0.trailing.equalTo(topDivider.snp.trailing)
        }
        
        bottomDivider.snp.makeConstraints {
            $0.width.equalTo(self.frame.width)
            $0.height.equalTo(1)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.top.equalTo(bottomDivider.snp.bottom)
            $0.width.equalTo(self.frame.width * 0.5)
        }
        
        startButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.top.equalTo(bottomDivider.snp.bottom)
            $0.width.equalTo(self.frame.width * 0.5)
        }
    }
    
    func configureView() {
        backgroundColor = .prMain
        alpha = 0.5
        
        topDivider.backgroundColor = .prMain
        bottomDivider.backgroundColor = .prMain.withAlphaComponent(0.7)
        
        setNameStackView()
        setMiddleStackView()
    }
    
    private func setNameStackView() {
        let stackSpacing: CGFloat = 6
        nameStackView.alignment = .center
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


