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
    
    private let mainView = HomeView()
    private let disposeBag = DisposeBag()
    
    private let rightBarButton = UIBarButtonItem(image: SymbolImage.프로필.img)

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .prBackground

        basicSetting()
        bindData()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        view.endEditing(true)
    }
    
    func bindData() {
 
        rightBarButton.rx.tap
            .bind(with: self) { owner, _ in
                print(#function)
            }
            .disposed(by: disposeBag)
        
        mainView.babButton.rx.tap
            .bind(with: self) { owner, _ in
                LevelManager.shared.getBabCount(owner.mainView.babTextfield.text ?? "")
                LevelManager.shared.caculateLevel()
                
                owner.mainView.babTextfield.text = ""
            }
            .disposed(by: disposeBag)
        
        mainView.waterButton.rx.tap
            .bind(with: self) { owner, _ in
                LevelManager.shared.getWaterCount(owner.mainView.waterTextfield.text ?? "")
                LevelManager.shared.caculateLevel()
                
                owner.mainView.waterTextfield.text = ""
            }
            .disposed(by: disposeBag)
        
        Observable.combineLatest(
            SavingInfo.$currentLevel,
            SavingInfo.$currentBab,
            SavingInfo.$currentWater,
            SavingInfo.$currentPouring
        )
        .bind(with: self) { owner, value in
            
            guard let lv = value.0, let bab = value.1, let water = value.2, let selectedPouring = value.3 else { return }
            
            owner.mainView.statusLabel.text = LevelManager.shared.currentStatusLabel(lv, bab, water)

            owner.mainView.pouringImage.image = UIImage(named: selectedPouring.imageName(lv))
            
            owner.mainView.pouringName.text = selectedPouring.rawValue
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
