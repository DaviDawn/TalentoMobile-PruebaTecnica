//
//  MainCoordinator.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func goToDetail(id: Int)
    func showError()
    func showSpinner()
    func endSpinner()
}

class MainCoordinator {
    var navigationController: UINavigationController
    let spinner = SpinnerViewController()
    
    init() {
        navigationController = UINavigationController()
    }
    
    func start() {
        let viewController = ListViewController()
        let viewModel = ListViewModel(coordinator: self)
        
        viewController.viewModel = viewModel
        viewModel.output = viewController
        
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    func showError() {
        let alert = UIAlertController(title: "error_title".localized, message: "error_description".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "error_button".localized, style: .default))
        navigationController.present(alert, animated: false)
    }
    
    func goToDetail(id: Int) {
        let viewController = DetailViewController()
        let viewModel = DetailViewModel(id: id, output: viewController, coordinator: self)
        
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showSpinner() {
        spinner.modalPresentationStyle = .overFullScreen
        navigationController.present(spinner, animated: false)
    }
    
    func endSpinner() {
        navigationController.dismiss(animated: false)
    }
}
