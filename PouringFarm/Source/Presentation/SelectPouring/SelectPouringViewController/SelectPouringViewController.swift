//
//  SelectPouringViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

final class SelectPouringViewController: UIViewController {
    
    private let mainView = SelectPouringView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
