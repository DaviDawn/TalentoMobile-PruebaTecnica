//
//  CharacterCellView.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 12/2/22.
//

import UIKit

class CharacterCellView: UITableViewCell, ConfigurableCell {
    lazy var characterView: CharacterView = {
        let character = CharacterView()
        character.translatesAutoresizingMaskIntoConstraints = false
        return character
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(characterView)
        
        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: topAnchor),
            characterView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(data: CharacterModel) {
        characterView.setupView(titleText: data.name, descriptionText: data.description, thumbnailURL: data.thumbnail.squareLink())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
