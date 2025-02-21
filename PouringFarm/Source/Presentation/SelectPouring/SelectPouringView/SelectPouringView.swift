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
        
        selectConllectionView.collectionViewLayout = collectionviewFlowLayout()
        
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
        selectConllectionView.backgroundColor = .clear
        
        selectConllectionView.register(SelectPouringCollectionViewCell.self, forCellWithReuseIdentifier: SelectPouringCollectionViewCell.id)
    }
    
    private func collectionviewFlowLayout() -> UICollectionViewFlowLayout {
        
        let insetSpacing: CGFloat = 20
        let cellSpacing: CGFloat = 25
        let cellWidth: CGFloat = (UIScreen.main.bounds.width - (insetSpacing * 2 + cellSpacing * 2)) / 3
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = cellSpacing
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.3)
        layout.sectionInset = UIEdgeInsets(top: insetSpacing, left: insetSpacing, bottom: .zero, right: insetSpacing)
        
        return layout
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
