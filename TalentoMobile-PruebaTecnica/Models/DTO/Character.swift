//
//  Character.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import Foundation

struct Character: Decodable {
    let id: Int?
    let name, description: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case thumbnail, urls , resourceURI, comics, series, stories, events
    }
}
