//
//  TestButton.swift
//  Example
//
//  Created by Russell Warwick on 09/05/2021.
//

import UIKit

final class TestButton: UIButton {

    init(text: String, background: UIColor = .white){
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.backgroundColor = background
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
