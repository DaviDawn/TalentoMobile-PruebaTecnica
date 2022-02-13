//
//  CharacterDataContainer.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import Foundation

struct CharacterDataContainer: Decodable {
    let offset, limit, total, count: Int?
    let results: [Character]?
}
