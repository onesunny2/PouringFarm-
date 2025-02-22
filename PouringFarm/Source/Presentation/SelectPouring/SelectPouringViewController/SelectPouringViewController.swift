//
//  SelectPouringViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit
import RxCocoa
import RxSwift

final class SelectPouringViewController: UIViewController {
    
    private let mainView = SelectPouringView()
    private let viewModel = SelectPouringViewModel()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        basicSetting()
        bind()
    }
    
    private func bind() {
        
        let input = SelectPouringViewModel.Input()
        let output = viewModel.transform(input: input)
        
        
        
    }

}

// collectionview 설정
extension SelectPouringViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PouringName.pouringsList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pouringInfo = PouringName.pouringsList()[indexPath.item]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectPouringCollectionViewCell.id, for: indexPath) as? SelectPouringCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCell(pouringInfo.name, pouringInfo.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pouringInfo = PouringName.pouringsList()[indexPath.item]
        let selectPopupView = SelectPopUpView(pouringInfo.type, 10)
        let vc = SelectPopUpViewController(selectPopupView)
        
        definesPresentationContext = true
        vc.modalPresentationStyle = .overCurrentContext
        
        present(vc, animated: true)
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
