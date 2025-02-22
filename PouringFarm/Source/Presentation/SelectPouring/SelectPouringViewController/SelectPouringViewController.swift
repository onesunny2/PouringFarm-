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
        
        let input = SelectPouringViewModel.Input(
            tappedCollectionCell: mainView.selectConllectionView.rx.itemSelected,
            selectedCellData: mainView.selectConllectionView.rx.modelSelected(PouringInfo.self)
        )
        let output = viewModel.transform(input: input)
        
        viewModel.pouringInfo
            .bind(to: mainView.selectConllectionView.rx.items(cellIdentifier: SelectPouringCollectionViewCell.id, cellType: SelectPouringCollectionViewCell.self)
            ) { (row, element, cell) in
                cell.configureCell(element.name, element.image)
            }
            .disposed(by: disposeBag)

        output.selectedPouring
            .bind(with: self) { owner, value in
                let view = SelectPopUpView(value.type, 10)
                let vc = SelectPopUpViewController(view)
                owner.viewTransition(type: .overCurrentContext, vc: vc)
            }
            .disposed(by: disposeBag)
    }
}

extension SelectPouringViewController {

    private func basicSetting() {
        navigationItem.title = NavigationTitle.캐릭터선택화면.text
        definesPresentationContext = true // overCurrentContext 사용을 위해
    }
}
