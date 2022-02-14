//
//  DetailDataHandler.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 13/2/22.
//

import Foundation
import Alamofire

class DetailDataHandler: DataHandler {
    func getCharacter(id: Int, completion: @escaping (Result<CharacterDataContainer?, CustomError>) -> Void) {
        let dataHandler = DataHandler()
        
        dataHandler.load(path: "\(APIURLS.characters.rawValue)\(id)?") { char in
            completion(char)
        }
    }
}
