//
//  SelectPopUpViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit
import RxCocoa
import RxSwift

final class SelectPopUpViewController: UIViewController {
    
    private var mainView: SelectPopUpView
    private let viewModel: SelectPopUpViewModel
    
    private let disposeBag = DisposeBag()

    init(_ popupView: SelectPopUpView, _ popupViewModel: SelectPopUpViewModel) {
        mainView = popupView
        viewModel = popupViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
print("팝업창 뜸")
        bind()
    }
 
    deinit {
        print("선택팝업창 VC Deinit")
    }
    
    private func bind() {
        
        let input = SelectPopUpViewModel.Input(
            tappedStartButton: mainView.startButton.rx.tap
        )
        let output = viewModel.transform(input: input)
        
        mainView.cancelButton.rx.tap
            .bind(with: self) { owner, _ in
                owner.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
        
        // TODO: (질문) 한번 더 가공을 하느냐, projectedValue의 목적에 따라 쓰느냐
        viewModel.$selectFirstPouring
            .bind(with: self) { owner, value in
                guard let value, value else {
                    print("저장된 선택유무 false")
                    return
                }
                
                owner.viewTransition(type: .changeRootVC, vc: HomeViewController())
            }
            .disposed(by: disposeBag)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
