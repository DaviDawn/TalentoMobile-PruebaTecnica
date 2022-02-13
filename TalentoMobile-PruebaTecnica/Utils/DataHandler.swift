//
//  DataHandler.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import Foundation
import SwiftHash
import Alamofire

class DataHandler {
    private let baseURL = "https://gateway.marvel.com"
    private let publicKey = "aaf319230587c79287b153bdca58c1e1"
    private let privateKey = "0e7dd492cb58b5747ae45edbd9fa6a266ccb0d4f"
    
    func load(path: String, completion: @escaping (Result<CharacterDataContainer?, AFError>) -> Void) {
        let url = baseURL + path + cifrateKeys()
        
        AF.request(url).response { response in
            let decode: JSONDecoder = JSONDecoder()
            guard let data = response.data,
                  let marvelInfo = try? decode.decode(CharacterDataWrapper.self, from: data),
                  marvelInfo.code == 200 else {
                      print("Error: \(response.error)")
                      completion(.failure(response.error!))
                      return
                  }
            completion(.success(marvelInfo.data))
        }
    }
    
    func cifrateKeys() -> String {
        let timestamp = String(Date().currentTimeMillis())
        let hash = MD5(timestamp+privateKey+publicKey).lowercased()
        return "ts=\(timestamp)&apikey=\(publicKey)&hash=\(hash)"
    }
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
