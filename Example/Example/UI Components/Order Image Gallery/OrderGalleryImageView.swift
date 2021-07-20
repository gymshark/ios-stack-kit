//
//  OrderImageGalleryView.swift
//  Example
//
//  Created by Russell Warwick on 19/07/2021.
//

import UIKit
import StackKit
import SharkUtils

final class OrderGalleryImageView: UIView {
    
    // MARK: - UI
    
    private let label = UILabel().with {
        $0.font = .systemFont(ofSize: 11.5, weight: .bold)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let imageStack = UIStackView().with({
        $0.spacing = 7
        $0.distribution(.fillEqually)
    })
    
    // MARK: -
    
    private let imagesLimit = 4
    private let imagesAspect = 0.9
    
    // MARK: - Init
    
    init(){
        super.init(frame: .zero)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Interface
    
    var images: [String]? {
        didSet {
            imageStack.removeAllArrangedSubviews()
            imageStack.addArrangedSubViews(generateImages() ?? [])
        }
    }

    // MARK: - Configure
    
    private func configure(){
        backgroundColor = .clear
    }
    
    private func setConstraints(){
        VStack {
            imageStack
        }
    }
    
    // MARK: - Builders
    
    private func generateImages() -> [UIView]? {
        return images?.prefix(imagesLimit).enumerated().map({ (index, name) -> UIView in
            if index == imagesLimit - 1 {
                let imageCount = ((images?.count ?? 0) - index)
                let overlayText = (imageCount == 0) ? nil : "+\(imageCount)"
                
                return OrderGalleryImage(image: UIImage(named: name), overlayText: overlayText)

            } else {
                return OrderGalleryImage (image: UIImage(named: name))
            }
        })
    }
}
