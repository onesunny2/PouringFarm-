//
//  SelectPouringViewModel.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import Foundation
import RxCocoa
import RxSwift

final class SelectPouringViewModel: BaseViewModel {
    
    let pouringInfo = Observable.just(PouringName.pouringsList(total: 30)) 
    var disposeBag: DisposeBag = DisposeBag()
    
    struct Input {
        let tappedCollectionCell: ControlEvent<IndexPath>
        let selectedCellData: ControlEvent<PouringInfo>
    }
    
    struct Output {
        let selectedPouring: PublishRelay<PouringInfo>
    }
    
    init() {
        print("푸링이선택하기 VM Init")
    }
    
    deinit {
        print("푸링이선택하기 VM Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        let selectedPouring = PublishRelay<PouringInfo>()
        
        Observable.zip(input.tappedCollectionCell, input.selectedCellData)
            .map { $0.1 }
            .bind { value in
                selectedPouring.accept(value)
            }
            .disposed(by: disposeBag)
        
        return Output(selectedPouring: selectedPouring)
    }
}
