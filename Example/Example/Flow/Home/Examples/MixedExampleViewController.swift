//
//  MixedExampleViewController.swift
//  Example
//
//  Created by Russell Warwick on 09/05/2021.
//

import UIKit
import SharkStackKit
import SharkUtils

final class MixedExampleViewController: UIViewController {
    
    // MARK: - UI
    
    private var headerStack: VStack? {
        guard isAdmin else { return nil }
        
        return VStack {
            TestLabel(text: "Good morning")
            TestLabel(text: "🦈")
        }
    }
    
    private lazy var settingsStack = VStack(spacing: 10) {
        TestButton(text: "Profile")
        TestButton(text: "Preferences")
        TestButton(text: "Help")
        if isAdmin {
            TestButton(text: "Admin Settings")
        }
    }
    
    // MARK: - Dependencies
    
    private let adminTags = ["Send push", "Clear cache", "Email clients"]
    private let isAdmin: Bool
    
    // MARK: - Init

    init(isAdmin: Bool = arc4random_uniform(2) == 0){
        self.isAdmin = isAdmin
        super.init(nibName: nil, bundle: nil)
        setConstraints()
        title = "Mixed Stack"
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Set up

    private func setConstraints(){
        view.backgroundColor = Constants.colors.background
        
        view.VScroll(spacing: 10) {
            
            headerStack
            
            settingsStack    
    
            HStack(spacing: 5) {
                TestLabel(text: "Calander").withHeight(80)
                TestLabel(text: "Contacts").withHeight(80)
            }.distribution(.fillEqually)
            
   
            if isAdmin {
                adminTags.compactMap({
                    TestButton(text: $0).withHeight(80)
                })
            }
            
            HStack(spacing: 5) {
                (0..<20).map { (id: Int) in
                    TestLabel(text: "\(id)")
                }
            }.distribution(.equalSpacing)
            
            Spacer()
        }.margin(.top(20))
    }
}
