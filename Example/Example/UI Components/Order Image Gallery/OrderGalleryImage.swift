//
//  OrderImage.swift
//  Example
//
//  Created by Russell Warwick on 19/07/2021.
//

import UIKit
import StackKit

final class OrderGalleryImage: UIView {
    
    // MARK: - Init
    
    private let imageView = UIImageView().with({
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.setCornerRadius(5)
    })
    
    private let label = UILabel().with({
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.backgroundColor = .init(white: 0.0, alpha: 0.8)
        $0.clipsToBounds = true
        $0.setCornerRadius(5)
    })

    // MARK: - Init
    
    init(image: UIImage?, overlayText: String? = nil){
        super.init(frame: .zero)
        setConstraints()
        imageView.image = image
        label.text = overlayText
        label.isHidden = overlayText == nil
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Configure
    
    private func setConstraints(){
        ZStack {
            imageView
            label
        }.withAspectRatio(0.85, priority: .init(999))
    }
}
