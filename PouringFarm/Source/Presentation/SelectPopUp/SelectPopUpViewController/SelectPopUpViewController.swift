//
//  SelectPopUpViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

final class SelectPopUpViewController: UIViewController {
    
    private let mainView = SelectPopUpView(.따끔푸링, 7)
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
