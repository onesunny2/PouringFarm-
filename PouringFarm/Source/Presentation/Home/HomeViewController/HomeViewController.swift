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
    
    private let saveName: UILabel = {
        let name = UILabel()
        name.font = .systemFont(ofSize: 15, weight: .medium)
        
        return name
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        @PouringDefaults(key: .푸링이종류, empty: PouringName.준비중.rawValue) var savePouring
        
        @PouringDefaults(key: .최초_푸링이_선택유무, empty: false) var isSelected
        
        print("==저장된 푸링이==", savePouring)
        print("==푸링이 선택함?==", isSelected)

        view.backgroundColor = .prBackground
        
        view.addSubview(button)
        view.addSubview(saveName)
        button.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(150)
        }
        
        saveName.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(20)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        bindData()
    }
    
    func bindData() {
        @PouringDefaults(key: .대장이름, empty: "아직없음") var daejang
        
        button.rx.tap
            .bind { _ in
                daejang = "김기영구"
            }.disposed(by: disposeBag)
        
        $daejang
            .bind(to: saveName.rx.text)
            .disposed(by: disposeBag)
    }

}
