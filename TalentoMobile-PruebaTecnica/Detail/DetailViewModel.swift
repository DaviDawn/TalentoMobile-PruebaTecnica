//
//  DetailViewModel.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 13/2/22.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    func fetch()
}

class DetailViewModel {
    weak var output: DetailViewControllerOutput?
    let coordinator: MainCoordinatorDelegate?
    
    let id: Int
    var character: CharacterModel? = nil
    let dataHandler = DetailDataHandler()
    
    init(id: Int, output: DetailViewControllerOutput, coordinator: MainCoordinatorDelegate) {
        self.id = id
        self.output = output
        self.coordinator = coordinator
    }
    
    deinit {
        print("deinit DetailViewModel")
    }
    
    func setupValues() {
        guard let character = character else { return }
        self.output?.configure(thumbnail: character.thumbnail, title: character.name, description: character.description)
    }
}

extension DetailViewModel: DetailViewModelDelegate {
    func fetch() {
        coordinator?.showSpinner()
        dataHandler.getCharacter(id: id) { result in
            self.coordinator?.endSpinner()
            switch result {
            case .success(let value):
                self.character = value?.characters?.filter({ $0.id == self.id }).first.flatMap({
                    return CharacterModel(id: $0.id, name: $0.name, description: $0.description, thumbnail: $0.thumbnail, comics: $0.comics, series: $0.series)
                })
                self.setupValues()
            case .failure:
                self.coordinator?.showError()
            }
        }
    }
}
