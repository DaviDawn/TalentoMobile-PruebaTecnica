//
//  DetailViewController.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 13/2/22.
//

import UIKit

protocol DetailViewControllerOutput: AnyObject {
    func configure(thumbnail: Thumbnail, title: String, description: String)
}

class DetailViewController: UIViewController {
    var viewModel: DetailViewModelDelegate?
    
    lazy var thumbnail: UIImageView = {
        let thumbnail = UIImageView()
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.contentMode = .scaleAspectFit
        
        thumbnail.clipsToBounds = true
        thumbnail.contentMode = .center
        return thumbnail
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        viewModel?.fetch()
    }
    
    func setupViews() {
        view.backgroundColor = .red
        
        view.addSubview(thumbnail)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            thumbnail.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            thumbnail.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}

extension DetailViewController: DetailViewControllerOutput {
    func configure(thumbnail: Thumbnail, title: String, description: String) {
        guard let url = URL(string: thumbnail.landscapeLink()) else { return }
        self.thumbnail.load(url: url)
        
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
