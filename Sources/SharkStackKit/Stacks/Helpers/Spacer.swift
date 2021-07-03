//
//  File.swift
//  
//
//  Created by Russell Warwick on 03/07/2021.
//

import UIKit

public final class Spacer: UIView {

    // MARK: - Init
    
    public init() {
        super.init(frame: .zero)
    }

    public init(w: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: w).isActive = true
    }
    
    public init(h: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: h).isActive = true
    }

    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
