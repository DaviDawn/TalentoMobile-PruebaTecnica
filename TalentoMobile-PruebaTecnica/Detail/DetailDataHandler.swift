//
//  DetailDataHandler.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 13/2/22.
//

import Foundation

class DetailDataHandler: DataHandler {
    func getCharacter(id: Int, completion: @escaping (CharacterDataContainer?) -> Void) {
        let dataHandler = DataHandler()
        
        dataHandler.load(path: "\(APIURLS.character.rawValue)\(id)?") { char in
            completion(char)
        }
    }
}
