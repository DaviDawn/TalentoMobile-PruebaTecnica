//
//  CharacterView.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import UIKit

class CharacterView: UIView {
    lazy var thumbnail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 4
        stack.axis = .vertical
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView(titleText: String, descriptionText: String, thumbnailURL: String) {
        backgroundColor = .clear
        verticalStackView.backgroundColor = .clear
        
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        
        guard let url = URL(string: thumbnailURL) else { return }
        thumbnail.load(url: url)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        addSubview(thumbnail)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalTo: topAnchor),
            thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            thumbnail.heightAnchor.constraint(equalToConstant: 100),
            thumbnail.widthAnchor.constraint(equalToConstant: 100),
            thumbnail.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            
            verticalStackView.centerYAnchor.constraint(equalTo: thumbnail.centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 12),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6)
        ])
    }
}
