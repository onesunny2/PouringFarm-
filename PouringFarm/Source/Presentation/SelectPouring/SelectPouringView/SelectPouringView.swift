//
//  SelectPouringView.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit
import SnapKit

final class SelectPouringView: UIView, BaseView {
    
    let selectConllectionView: UICollectionView
    
    override init(frame: CGRect) {
        
        selectConllectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }

    func configureHierarchy() {
        self.addSubview(selectConllectionView)
    }
    
    func configureLayout() {
        selectConllectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    func configureView() {
        backgroundColor = .prBackground
        selectConllectionView.backgroundColor = .prMain
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
