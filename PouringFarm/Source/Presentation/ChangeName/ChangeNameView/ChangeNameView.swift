//
//  ChangeNameView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import UIKit
import SnapKit

final class ChangeNameView: UIView, BaseView {
    
    let textfield: BaseUITextfield
    private let underline = UIView()
    
    override init(frame: CGRect) {
        
        textfield = BaseUITextfield(placeholder: "변경할 닉네임을 적어주세요", alignment: .left, keyboard: .default)
        
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        self.addSubview(textfield)
        self.addSubview(underline)
    }
    
    func configureLayout() {
        textfield.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
        
        underline.snp.makeConstraints {
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
            $0.bottom.equalTo(textfield.snp.bottom).offset(6)
            $0.height.equalTo(1)
        }
    }
    
    func configureView() {
        backgroundColor = .prBackground
        underline.backgroundColor = .prNavi
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
