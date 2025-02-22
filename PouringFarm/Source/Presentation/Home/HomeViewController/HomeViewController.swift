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
    
    private let rightBarButton = UIBarButtonItem(image: SymbolImage.프로필.img)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .prBackground
        
        basicSetting()
        bindData()
    }
    
    func bindData() {
 
        rightBarButton.rx.tap
            .bind(with: self) { owner, _ in
                print(#function)
            }
            .disposed(by: disposeBag)
    }

}

extension HomeViewController {
    private func basicSetting() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.prNavi]
        navigationItem.title = NavigationTitle.홈화면(daejang: SavingInfo.daejang).text
        
        navigationController?.navigationBar.tintColor = .prNavi
        navigationItem.rightBarButtonItem = rightBarButton
    }
}
