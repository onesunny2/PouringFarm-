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
        // 첫 캐릭터 선택 유무 -> 저장되면 화면 전환되도록 해야 함
        let isSelectedFirst: PublishRelay<Bool>
    }
    
    init(_ selectedPouring: PouringName) {
        print("선택팝업창 VM Init")
        
        self.selectedPouring = selectedPouring
    }
    
    deinit {
        print("선택팝업창 VM Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        let isSelected = PublishRelay<Bool>()
        
        input.tappedStartButton
            .bind(with: self) { owner, _ in
                owner.savePouring = owner.selectedPouring.rawValue
                owner.selectFirstPouring = true
                isSelected.accept(owner.selectFirstPouring)
            }
            .disposed(by: DisposeBag())
        
        return Output(isSelectedFirst: isSelected)
    }
}
