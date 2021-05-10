//
//  HomeVC.swift
//  Example
//
//  Created by Russell Warwick on 09/05/2021.
//

import UIKit
import SharkStackKit
import SharkUtils

final class HomeVC: UIViewController {
    
    // MARK: - UI
    
    private lazy var verticalStackExample = TestButton(text: "Vertical Stack").with {
        $0.touchUpInside.action = { [weak self] in
            self?.show(VerticalExampleVC(), sender: self)
        }
    }
    
    private lazy var horizontalStackExample = TestButton(text: "Horizontal Stack").with {
        $0.touchUpInside.action = { [weak self] in
            self?.show(HorizontalExampleVC(), sender: self)
        }
    }
    
    private lazy var feedExample =  TestButton(text: "Feed Example").with {
        $0.touchUpInside.action = { [weak self] in
            self?.show(FeedExampleVC(), sender: self)
        }
    }
    
    private lazy var mixedExample =  TestButton(text: "Mixed Example").with {
        $0.touchUpInside.action = { [weak self] in
            self?.show(MixedExampleVC(), sender: self)
        }
    }

    // MARK: - Init
    
    init(){
        super.init(nibName: nil, bundle: nil)
        setConstraints()
        title = "SharkStackKit 🦈"
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Set up

    
    private func setConstraints(){
        view.backgroundColor = Constants.colors.background
        
        view.ScrollView(spacing: 15) {
            
            verticalStackExample.withHeight(100)
            horizontalStackExample.withHeight(100)
            mixedExample.withHeight(100)
            feedExample.withHeight(100)
            
        }.margin(.insets(top: 20, left: 20, right: 20))
    }
}
