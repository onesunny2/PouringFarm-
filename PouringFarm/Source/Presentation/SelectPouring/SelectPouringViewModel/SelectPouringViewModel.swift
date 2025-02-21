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
    
    var disposeBag: DisposeBag = DisposeBag()
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    init() {
        print("푸링이선택하기 VM Init")
    }
    
    deinit {
        print("푸링이선택하기 VM Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        return Output()
    }
}
