//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Мухаммад Махмудов on 08.04.2025.
//

import UIKit

final class AlertPresenter {
    func show(model: AlertModel, on viewController: UIViewController) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: model.buttonText, style: .default) { _ in
            model.completion?()
        }
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
