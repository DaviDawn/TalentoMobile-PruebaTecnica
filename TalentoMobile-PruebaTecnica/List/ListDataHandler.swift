//
//  ListDataHandler.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import Foundation
import Alamofire

class ListDataHandler: DataHandler {
    func getList(completion: @escaping (Result<CharacterDataContainer?, AFError>) -> Void) {
        let dataHandler = DataHandler()
        
        dataHandler.load(path: APIURLS.list.rawValue) { char in
            completion(char)
        }
    }
}
