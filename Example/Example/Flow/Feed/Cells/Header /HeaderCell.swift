//
//  HeaderCell.swift
//  Example
//
//  Created by Russell Warwick on 19/07/2021.
//

import UIKit
import StackKit
import SharkUtils
import ConstraintKit

final class HeaderCell: UITableViewCell {
    
    // MARK: - UI
    
    private let headlineLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 17, weight: .heavy)
        $0.textColor = .black
    }
    
    private let initialsLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 15, weight: .heavy)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let initialsView = UIView().with {
        $0.backgroundColor = .darkGray
        $0.setCornerRadius(18)
        $0.clipsToBounds = true
    }
    
    private let searchButton = UIImageView().with({
        $0.image = UIImage(named: "search-icon")
        $0.contentMode = .scaleAspectFit
    })
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - ViewModel
    
    var viewModel: HeaderCellViewModel? {
        didSet {
            headlineLabel.text = viewModel?.headlineText
            initialsLabel.text = viewModel?.initialsText
        }
    }
    
    // MARK: - Configure
    
    private func configure(){
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setConstraints(){
        
        initialsView.VStack {
            initialsLabel
        }
        
        contentView.HStack {
            initialsView.withSquare(36)
            Spacer(w: 10)
            headlineLabel
            searchButton.withSquare(20)
        }.margin(.insets(top: Constants.layout.spacing, left: Constants.layout.tableMargin, right: Constants.layout.tableMargin))
        .alignment(.center)
    }
}
