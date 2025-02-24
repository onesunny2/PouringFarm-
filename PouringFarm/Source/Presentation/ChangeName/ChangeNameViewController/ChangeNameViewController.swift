//
//  ChangeNameViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import UIKit
import RxCocoa
import RxSwift

final class ChangeNameViewController: UIViewController {
    
    private let mainView = ChangeNameView()
    private let viewModel = ChangeViewModel()
    private let disposeBag = DisposeBag()
    
    private let rightBarButton = UIBarButtonItem(title: "저장")
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicSetting()
        bind()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        view.endEditing(true)
    }
    
    private func bind() {
        
        let input = ChangeViewModel.Input(
            tappedSaveButton: rightBarButton.rx.tap,
            newNickname: mainView.textfield.rx.text.orEmpty
        )
        let output = viewModel.transform(input: input)
        
        output.dismissAction
            .bind(with: self) { owner, _ in
                owner.navigationController?.popViewController(animated: true)
            }
            .disposed(by: disposeBag)
    }
}

extension ChangeNameViewController {
    
    private func basicSetting() {
        navigationItem.title = NavigationTitle.대장이름설정.text
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.prNavi]
        navigationController?.navigationBar.tintColor = .prNavi
        navigationItem.rightBarButtonItem = rightBarButton
    }
}
