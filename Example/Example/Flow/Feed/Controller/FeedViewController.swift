//
//  FeedViewController.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import UIKit
import StackKit

final class FeedViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView = UITableView().with {
        $0.register(FeedItemCell.self, forCellReuseIdentifier: FeedItemCell.identifier)
        $0.register(OrderCell.self, forCellReuseIdentifier: OrderCell.identifier)
        $0.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        $0.rowHeight = UITableView.automaticDimension
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
    }
    
    // MARK: - Dependencies
    
    private let viewModel: FeedViewModel
    
    // MARK: - Init
    
    init(viewModel: FeedViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Configure

    private func setConstraints(){
        view.VStack(useSafeArea: false) {
            tableView
        }
    }

    private func configure(){
        view.backgroundColor = Constants.colors.background
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = viewModel.cellItem(for: indexPath) else { return UITableViewCell() }
                
        switch item {
        case .header(let vm):
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            cell.viewModel = vm
            return cell
            
        case .feedItem(let vm):
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedItemCell.identifier, for: indexPath) as! FeedItemCell
            cell.viewModel = vm
            return cell
            
        case .order(let vm):
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.identifier, for: indexPath) as! OrderCell
            cell.viewModel = vm
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
}
