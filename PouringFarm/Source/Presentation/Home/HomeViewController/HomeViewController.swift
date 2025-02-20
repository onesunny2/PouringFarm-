//
//  HomeViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/20/25.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class HomeViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("저장", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.prMain, for: .normal)
    
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .prBackground
        
        @PouringDefaults(key: SavingInfo.대장이름.rawValue, empty: "아직없음") var daejang
        print(daejang)
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(150)
        }
        
        button.rx.tap
            .bind { _ in
                daejang = "이원선"
            }.disposed(by: disposeBag)
    }

}
