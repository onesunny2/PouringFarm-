//
//  SelectPopUpViewModel.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/22/25.
//

import Foundation
import RxSwift
import RxCocoa

final class SelectPopUpViewModel: BaseViewModel {
    
    var disposeBag: DisposeBag = DisposeBag()
    let selectedPouring: PouringName
    
    @PouringDefaults(key: .푸링이종류, empty: PouringName.헤실푸링.rawValue) var savePouring
    @PouringDefaults(key: .최초_푸링이_선택유무, empty: false) var selectFirstPouring

    struct Input {
        let tappedStartButton: ControlEvent<Void>
    }
    
    struct Output {

    }
    
    init(_ selectedPouring: PouringName) {
        print("선택팝업창 VM Init")
        
        self.selectedPouring = selectedPouring
    }
    
    deinit {
        print("선택팝업창 VM Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        input.tappedStartButton
            .bind(with: self) { owner, _ in
                print(#function)
                owner.savePouring = owner.selectedPouring.rawValue
                owner.selectFirstPouring = true
            }
            .disposed(by: disposeBag)
        
        return Output()
    }
}
