//
//  ViewController.swift
//  Example
//
//  Created by Russell Warwick on 07/05/2021.
//

import UIKit
import SharkStackKit

final class ViewController: UIViewController {
    
    // MARK: - Init
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}
