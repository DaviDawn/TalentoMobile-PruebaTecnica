//
//  Thumbnail.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import Foundation

struct Thumbnail: Decodable {
    let path: String?
    let thumbnailExtension: Extension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    func squareLink() -> String {
        guard let thumbnailExtension = thumbnailExtension else { return ""}
        return "\(sequrePath())/standard_large.\(thumbnailExtension)"
    }
    
    func landscapeLink() -> String {
        guard let thumbnailExtension = thumbnailExtension else { return ""}
        return "\(sequrePath())/landscape_xlarge.\(thumbnailExtension)"
    }
    
    private func sequrePath() -> String {
        guard let path = path else { return "" }
        return path.replacingOccurrences(of: "http", with: "https", options: .literal, range: nil)
    }
}
