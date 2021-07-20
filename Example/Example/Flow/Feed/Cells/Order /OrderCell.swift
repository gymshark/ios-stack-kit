//
//  OrderCell.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import UIKit
import StackKit

final class OrderCell: UITableViewCell {
    
    // MARK: - UI
    
    private let card = UIView().with {
        $0.setCornerRadius(12)
        $0.backgroundColor = .white
    }
    
    private let titleLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 18, weight: .heavy)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    private let subtitleLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .black
    }
    
    private let statusBar = UIView().with {
        $0.backgroundColor = Constants.colors.tint
        $0.setCornerRadius(3)
    }

    private let gallery = OrderGalleryImageView()
    
    private let moreButton = UIImageView().with({
        $0.image = UIImage(named: "more-icon")
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
    
    var viewModel: OrderCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.titleText
            subtitleLabel.text = viewModel.subtitleText
            gallery.images = viewModel.images
        }
    }
    
    // MARK: - Configure
    
    private func configure(){
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setConstraints(){
        contentView.ZStack {
            card
            VStack(spacing: 5) {
                
                HStack {
                    titleLabel
                    moreButton.withWidth(26)
                }.alignment(.center)
                
                subtitleLabel
                Spacer(h: 3)
                statusBar.withHeight(6)
                Spacer(h: 5)
                gallery
            }.margin(.all(Constants.layout.contentMargin))

        }.margin(.insets(top: Constants.layout.spacing, left: Constants.layout.tableMargin, right: Constants.layout.tableMargin))
    }
}
