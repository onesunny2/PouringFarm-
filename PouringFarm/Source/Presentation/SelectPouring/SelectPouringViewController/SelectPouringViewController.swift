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
    private let disposeBag = DisposeBag()

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
        
        viewModel.pouringInfo
            .bind(to: mainView.selectConllectionView.rx.items(cellIdentifier: SelectPouringCollectionViewCell.id, cellType: SelectPouringCollectionViewCell.self)
            ) { (row, element, cell) in
                cell.configureCell(element.name, element.image)
            }
            .disposed(by: disposeBag)

        Observable.zip(mainView.selectConllectionView.rx.itemSelected, mainView.selectConllectionView.rx.modelSelected((type: PouringName, name: String, image: String).self))
            .map { $0.1 }
            .bind(with: self) { owner, pouring in
                
                let view = SelectPopUpView(pouring.type, 10)
                let vc = SelectPopUpViewController(view)
                
                owner.definesPresentationContext = true
                vc.modalPresentationStyle = .overCurrentContext
                
                owner.present(vc, animated: true)
            }
            .disposed(by: disposeBag)
    }

}

// 기본셋팅
extension SelectPouringViewController {
    
    private func basicSetting() {
        navigationItem.title = NavigationTitle.캐릭터선택화면.text
    }
}
