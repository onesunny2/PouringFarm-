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
    
    func alert(title: String, message: String, resetAction: @escaping () -> ()) {
        
        let message = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "응", style: .default) { _ in
            resetAction()
        }
        let cancel = UIAlertAction(title: "아니!", style: .default)
        
        message.addAction(cancel)
        message.addAction(ok)
        
        present(message, animated: true)
    }
}
