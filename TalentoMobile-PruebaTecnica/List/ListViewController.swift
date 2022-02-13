//
//  ListViewController.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 11/2/22.
//

import UIKit

protocol ListViewControllerOutput: AnyObject {
    func updateView()
}

class ListViewController: UIViewController {
    
    var viewModel: ListViewModelDelegate?

    deinit {
        print("deinit ListViewController")
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.isUserInteractionEnabled = true
        table.delegate = self
        table.dataSource = self
        
        table.register(CharacterCellView.self, forCellReuseIdentifier: CharacterCellView.defaultIdentifier)
        
        return table
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel?.fetch()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension ListViewController: ListViewControllerOutput {
    func updateView() {
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.amountOfCharacters ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else { return UITableViewCell() }
        let item = TableCellConfigurator<CharacterCellView, CharacterModel>(item: viewModel.getCharacterModel(from: indexPath))
        guard let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId) as? CharacterCellView else {
            fatalError()
        }
        cell.selectionStyle = .none
        item.configure(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didTapCell(indexPath)
    }
}
