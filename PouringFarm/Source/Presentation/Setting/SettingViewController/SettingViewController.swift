//
//  SettingViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import UIKit
import RxCocoa
import RxSwift

final class SettingViewController: UIViewController {
    
    private let mainView = SettingView()
    private let disposeBag = DisposeBag()
 
    lazy var tableviewItems = Observable.just(settings)
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicSetting()
        bind()
    }
    
    private func bind() {
        
        mainView.tableView.rx.itemSelected
            .bind(with: self) { owner, indexPath in
                
                switch indexPath.row {
                case 0:
                    let vc = ChangeNameViewController()
                    owner.viewTransition(type: .navigation, vc: vc)
                case 1:
                    let vc = SelectPouringViewController()
                    owner.viewTransition(type: .navigation, vc: vc)
                case 2:
                    let title = "데이터 초기화"
                    let message = "정말 다시 처음부터 시작하시겠어요?"
                    owner.alert(title: title, message: message) {
                        SavingInfo.reset()
                        owner.viewTransition(type: .changeRootVC, vc: SelectPouringViewController())
                    }
                default:
                    break
                }
            }
            .disposed(by: disposeBag)
        
        tableviewItems
            .bind(to: mainView.tableView.rx.items(
                cellIdentifier: SettingTableViewCell.id,
                cellType: SettingTableViewCell.self)
            ) { (row, element, cell) in
                cell.textLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
                cell.textLabel?.text = element.title
                cell.imageView?.image = element.image
                cell.tintColor = .prNavi
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = .clear
                cell.separatorInset.left = .zero
                
                guard row == 0 else { return }
                SavingInfo.$daejang
                    .bind(with: self) { owner, name in
                        guard let name else { return }
                        cell.detailTextLabel?.text = name
                    }
                    .disposed(by: self.disposeBag)
            }
            .disposed(by: disposeBag)
    }
 
}

extension SettingViewController {
    private func basicSetting() {
        navigationItem.title = NavigationTitle.설정화면.text
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.prNavi]
        navigationController?.navigationBar.tintColor = .prNavi
    }
}
