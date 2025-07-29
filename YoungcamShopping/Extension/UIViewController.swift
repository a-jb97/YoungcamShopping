//
//  UIViewController.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/29/25.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, ok: String, okHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            okHandler()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
}
