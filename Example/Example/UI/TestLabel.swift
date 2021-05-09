//
//  TestLabel.swift
//  Example
//
//  Created by Russell Warwick on 09/05/2021.
//

import UIKit

final class TestLabel: UILabel {

    init(text: String, background: UIColor = .white){
        super.init(frame: .zero)
        self.text = text
        self.backgroundColor = background
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
