//
//  SettingViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/24/25.
//

import UIKit

final class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .prBackground
        basicSetting()
    }
 
}

extension SettingViewController {
    private func basicSetting() {
        navigationItem.title = NavigationTitle.설정화면.text
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.prNavi]
        navigationController?.navigationBar.tintColor = .prNavi
    }
}
