//
//  SelectPouringViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

final class SelectPouringViewController: UIViewController {
    
    private let mainView = SelectPouringView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        basicSetting()
    }

}

// collectionview 설정
extension SelectPouringViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectPouringCollectionViewCell.id, for: indexPath) as? SelectPouringCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCell()
        cell.layoutIfNeeded()
        
        return cell
    }
}

// 기본셋팅
extension SelectPouringViewController {
    
    private func basicSetting() {
        mainView.selectConllectionView.delegate = self
        mainView.selectConllectionView.dataSource = self
        
        navigationItem.title = NavigationTitle.캐릭터선택화면.text
    }
}
