//
//  SelectPopUpViewController.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

final class SelectPopUpViewController: UIViewController {
    
    private var mainView: SelectPopUpView

    @PouringDefaults(key: .푸링이종류, empty: PouringName.헤실푸링.rawValue) var savedPouring
    
    init(_ popupView: SelectPopUpView) {
        mainView = popupView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(savedPouring)
        
        AddTargets()
    }
    
    private func AddTargets() {
        mainView.cancelButton.addTarget(self, action: #selector(tappedCancelButton), for: .touchUpInside)
        mainView.startButton.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)
    }
    
    @objc private func tappedCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func tappedStartButton() {
        print(#function)
        
        savedPouring = PouringName.반짝푸링.rawValue // TODO: 전달받는 값 이름으로 변경 필요
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
