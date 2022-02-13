//
//  CharacterModel.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 12/2/22.
//

import Foundation

struct CharacterModel {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let comics: Comics
    let series: Comics
    
    init(id: Int? = nil, name: String? = nil, description: String? = nil, thumbnail: Thumbnail? = nil, comics: Comics? = nil, series: Comics? = nil) {
        self.id = id ?? 0
        self.name = name ?? ""
        self.description = description ?? ""
        self.thumbnail = thumbnail ?? Thumbnail(path: "", thumbnailExtension: Extension(rawValue: ""))
        self.comics = comics ?? Comics(available: 0, collectionURI: "", items: [], returned: 0)
        self.series = series ?? Comics(available: 0, collectionURI: "", items: [], returned: 0)
    }
}
