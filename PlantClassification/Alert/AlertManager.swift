//
//  AlertManager.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 4.03.2024.
//

import UIKit

public class AlertManager {
    
    static func showAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
