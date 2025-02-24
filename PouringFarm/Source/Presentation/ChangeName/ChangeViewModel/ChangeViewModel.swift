//
//  ChangeViewModel.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import Foundation
import RxCocoa
import RxSwift

final class ChangeViewModel: BaseViewModel {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let textfieldText = BehaviorRelay(value: "")
    
    struct Input {
        let tappedSaveButton: ControlEvent<()>
        let newNickname: ControlProperty<String>
    }
    
    struct Output {
        let dismissAction: PublishRelay<Void>
    }
    
    init() {
        
    }
    
    func transform(input: Input) -> Output {
        
        let dismissAction = PublishRelay<Void>()

        input.tappedSaveButton
            .withLatestFrom(input.newNickname)
            .bind(with: self) { owner, text in
                
                guard text.count >= 2, text.count <= 6 else { return }
                SavingInfo.daejang = text
                dismissAction.accept(())
            }
            .disposed(by: disposeBag)
        
        return Output(dismissAction: dismissAction)
    }
}
