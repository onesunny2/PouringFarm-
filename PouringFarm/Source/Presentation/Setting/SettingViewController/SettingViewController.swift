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
 
    lazy var tableview = Observable.just(settings)
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicSetting()
        bind()
    }
    
    private func bind() {
        
        tableview
            .bind(to: mainView.tableView.rx.items(
                cellIdentifier: SettingTableViewCell.id,
                cellType: SettingTableViewCell.self)
            ) { (row, element, cell) in
                cell.textLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
                cell.textLabel?.text = element.title
                cell.detailTextLabel?.text = element.detail
                cell.imageView?.image = element.image
                cell.tintColor = .prNavi
                cell.accessoryType = .disclosureIndicator
                cell.backgroundColor = .clear
                cell.separatorInset.left = .zero
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
