//
//  FeedItemCell.swift
//  Example
//
//  Created by Russell Warwick on 13/07/2021.
//

import UIKit
import StackKit

final class FeedItemCell: UITableViewCell {
    
    // MARK: - UI
    
    private let cardImage = UIImageView().with {
        $0.setCornerRadius(12)
        $0.backgroundColor = .gray
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    private let titleLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 18, weight: .heavy)
        $0.textColor = .white
        $0.numberOfLines = 2
    }
    
    private let subtitleLabel = UILabel().with {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .white
    }
    
    private let button = UIImageView(image: UIImage(named: "button-icon"))
    
    private let tagView = TagView()
    
    private lazy var tagStack = HStack {
        tagView
        Spacer()
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - ViewModel
    
    var viewModel: FeedItemViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.titleText
            subtitleLabel.text = viewModel.subtitleText
            tagView.text = viewModel.tagText
            tagStack.isHidden = viewModel.isTagHidden
            cardImage.image = UIImage(named: viewModel.imageName)
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
            cardImage
            VStack {
                tagStack
                Spacer()
                
                HStack {
                    VStack {
                        titleLabel
                        Spacer(h: 6)
                        subtitleLabel
                    }
                    Spacer(w: 10)
                   button.withSquare(50)
                }.alignment(.center)
                
            }.margin(.all(Constants.layout.contentMargin))
            
        }.margin(.insets(top: Constants.layout.spacing, left: Constants.layout.tableMargin, right: Constants.layout.tableMargin))
        .withAspectRatio(0.9, priority: .init(999))
    }
}
