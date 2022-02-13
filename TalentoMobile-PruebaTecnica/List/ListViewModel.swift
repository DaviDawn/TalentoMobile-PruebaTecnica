//
//  ListViewModel.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import Foundation

protocol ListViewModelDelegate: AnyObject {
    var amountOfCharacters: Int { get }
    
    func didTapCell(_ index: IndexPath)
    func fetch()
    func getCharacterModel(from index: IndexPath) -> CharacterModel
}

class ListViewModel: ListViewModelDelegate {
    var coordinator: MainCoordinatorDelegate?
    weak var output: ListViewControllerOutput?
    
    let dataHandler: ListDataHandler
    
    var characterDataContainer: CharacterDataContainer?
    
    deinit {
        print("deinit ListViewModel")
    }
    
    init(coordinator: MainCoordinatorDelegate) {
        self.coordinator = coordinator
        self.dataHandler = ListDataHandler()
    }
    
    // MARK: - Extension
    
    var amountOfCharacters: Int {
        return characterDataContainer?.count ?? 0
    }
    
    func didTapCell(_ index: IndexPath) {
        guard let id = characterDataContainer?.results?[index.row].id else { return }
        coordinator?.goToDetail(id: id)
    }
    
    func fetch() {
        coordinator?.showSpinner()
        
        dataHandler.getList() { result in
            self.coordinator?.endSpinner()
            self.characterDataContainer = result
            self.output?.updateView()
        }
    }
    
    func getCharacterModel(from index: IndexPath) -> CharacterModel {
        guard let characters = self.characterDataContainer?.results else { return CharacterModel() }
        let charactersModel = characters.compactMap() {
            return CharacterModel(id: $0.id, name: $0.name, description: $0.description, thumbnail: $0.thumbnail, comics: $0.comics, series: $0.series)
        }
        
        return charactersModel[index.row]
    }
}
