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

/*
 
 userdefaults 키값 중 한개의 key 이름을 잘못 설정해서 초기화 하거나 해당 데이터를 저장하면 앱이 터지는 현상이 발생해서
 부득이하게 home화면부터 시작하게 설정해두었습니다 ㅠㅠ 앱 둘러보시다가 혹시나 변경하기 메뉴에서 확인은 안누르고 봐주시면 감사하겠습니다...
 
 */

final class HomeViewController: UIViewController {
    
    private let mainView = HomeView()
    private let viewMocel = HomeViewModel()
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
        
        let bab = mainView.babButton.rx.tap
            .withUnretained(self)
            .map { _ in
                self.mainView.babTextfield.text
            }
        let water = mainView.waterButton.rx.tap
             .withUnretained(self)
             .map { _ in
                 self.mainView.waterTextfield.text
             }
        
        let input = HomeViewModel.Input(
            babTextfieldNumber: bab,
            waterTextfieldNumber: water
        )
        let output = viewMocel.transform(input: input)
 
        rightBarButton.rx.tap
            .bind(with: self) { owner, _ in
                owner.viewTransition(type: .navigation, vc: SettingViewController())
            }
            .disposed(by: disposeBag)

        output.resetBabText
            .bind(to: mainView.babTextfield.rx.text)
            .disposed(by: disposeBag)
        
        output.resetWaterText
            .bind(to: mainView.waterTextfield.rx.text)
            .disposed(by: disposeBag)
        
        output.randomComment
            .bind(to: mainView.bubbleView.commentLabel.rx.text)
            .disposed(by: disposeBag)
        
        // MARK: UI 자동 업데이트
        Observable.combineLatest(
            SavingInfo.$currentLevel,
            SavingInfo.$currentBab,
            SavingInfo.$currentWater,
            SavingInfo.$currentPouring,
            SavingInfo.$daejang
        )
        .bind(with: self) { owner, value in
            
            guard let lv = value.0, let bab = value.1, let water = value.2, let selectedPouring = value.3, let daejang = value.4 else { return }
            
            owner.mainView.statusLabel.text = LevelManager.shared.currentStatusLabel(lv, bab, water)
            owner.mainView.pouringImage.image = UIImage(named: PouringName.imageName(selectedPouring, lv))
            owner.mainView.pouringName.text = selectedPouring
            owner.navigationItem.title = NavigationTitle.홈화면(daejang: daejang).text
        }
        .disposed(by: disposeBag)
    }

}

extension HomeViewController {
    private func basicSetting() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.prNavi]
        
        navigationController?.navigationBar.tintColor = .prNavi
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = rightBarButton
    }
}
