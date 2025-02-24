//
//  HomeViewModel.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import Foundation
import RxCocoa
import RxSwift

final class HomeViewModel: BaseViewModel {
    
    struct Input {
        let babTextfieldNumber: Observable<String?>
        let waterTextfieldNumber: Observable<String?>
        let viewWillAppearTrigger: PublishRelay<Void>
    }
    
    struct Output {
        let resetBabText: PublishRelay<String>
        let resetWaterText: PublishRelay<String>
        let randomComment: PublishRelay<Void>
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let viewWillAppearTrigger = PublishRelay<Void>()
    
    init() {
        print("Home VM Init")
    }
    
    deinit {
        print("Home VM Deinit")
    }
    
    func transform(input: Input) -> Output {
        
        let resetBabText = PublishRelay<String>()
        let resetWaterText = PublishRelay<String>()
        let randomComment = PublishRelay<Void>()
        
        input.babTextfieldNumber
            .bind(with: self) { owner, text in
                LevelManager.shared.getBabCount(text ?? "")
                LevelManager.shared.caculateLevel()
                resetBabText.accept("")
                randomComment.accept(())
            }
            .disposed(by: disposeBag)

        input.waterTextfieldNumber
        .bind(with: self) { owner, text in
            LevelManager.shared.getWaterCount(text ?? "")
            LevelManager.shared.caculateLevel()
            resetWaterText.accept("")
            randomComment.accept(())
        }
        .disposed(by: disposeBag)
        
        input.viewWillAppearTrigger
            .bind(with: self) { owner, _ in
                randomComment.accept(())
            }
            .disposed(by: disposeBag)
        
        return Output(
            resetBabText: resetBabText,
            resetWaterText: resetWaterText,
            randomComment: randomComment
        )
    }
}
