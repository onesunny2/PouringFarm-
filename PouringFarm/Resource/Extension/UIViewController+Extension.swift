//
//  UIViewController+Extension.swift
//  PouringFarm
//
//  Created by Lee Wonsun on 2/21/25.
//

import UIKit

extension UIViewController {
    
    func viewTransition(type: ViewTransition, vc: UIViewController) {
        
        switch type {
        case .navigation:
            navigationController?.pushViewController(vc, animated: true)
        case .overCurrentContext:
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        case .changeRootVC:
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else { return }
            
            window.rootViewController = UINavigationController(rootViewController: vc)
            window.makeKeyAndVisible()
        }
    }
}
