//
//  VerticalExampleVC.swift
//  Example
//
//  Created by Russell Warwick on 07/05/2021.
//

import UIKit
import SharkStackKit
import ConstraintKit

final class VerticalExampleViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var button1 = UIButton().with {
        $0.backgroundColor = .blue
        $0.setTitle("Hide", for: .normal)
        $0.touchUpInside.action = { [weak self] in
            UIView.animate(withDuration: 0.3) {
                self?.button2.isHidden.toggle()
            }
        }
    }
    
    private let button2 = UIButton().with {
        $0.backgroundColor = .cyan
        $0.setTitle("VerticalExample", for: .normal)
    }
    
    private let label = UILabel().with {
        $0.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et viverra ipsum. Nullam mauris justo, gravida vel risus semper, pellentesque malesuada leo. Integer leo dui, dignissim ac eros in, bibendum pretium eros. Phasellus vel arcu in risus porta tempor ut et ante. Sed neque nibh, venenatis et elit sed, elementum pulvinar risus. Donec sed nunc vestibulum nulla feugiat sagittis id non justo. Pellentesque bibendum commodo nisi et fringilla."
        $0.textColor = .black
        $0.backgroundColor = .orange
        $0.numberOfLines = 0
    }
    
    private let label3 = UILabel().with {
        $0.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et viverra ipsum. Nullam mauris justo, gravida vel risus semper, pellentesque malesuada leo. Integer leo dui, dignissim ac eros in, bibendum pretium eros. Phasellus vel arcu in risus porta tempor ut et ante. Sed neque nibh, venenatis et elit sed, elementum pulvinar risus. Donec sed nunc vestibulum nulla feugiat sagittis id non justo. Pellentesque bibendum commodo nisi et fringilla."
        $0.textColor = .black
        $0.backgroundColor = .orange
        $0.numberOfLines = 0
    }
    
    
    private let label4 = UILabel().with {
        $0.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et viverra ipsum. Nullam mauris justo, gravida vel risus semper, pellentesque malesuada leo. Integer leo dui, dignissim ac eros in, bibendum pretium eros. Phasellus vel arcu in risus porta tempor ut et ante. Sed neque nibh, venenatis et elit sed, elementum pulvinar risus. Donec sed nunc vestibulum nulla feugiat sagittis id non justo. Pellentesque bibendum commodo nisi et fringilla."
        $0.textColor = .black
        $0.backgroundColor = .purple
        $0.numberOfLines = 0
    }
    
    
    private let label5 = UILabel().with {
        $0.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et viverra ipsum. Nullam mauris justo, gravida vel risus semper, pellentesque malesuada leo. Integer leo dui, dignissim ac eros in, bibendum pretium eros. Phasellus vel arcu in risus porta tempor ut et ante. Sed neque nibh, venenatis et elit sed, elementum pulvinar risus. Donec sed nunc vestibulum nulla feugiat sagittis id non justo. Pellentesque bibendum commodo nisi et fringilla."
        $0.textColor = .black
        $0.backgroundColor = .orange
        $0.numberOfLines = 0
    }

    // MARK: - Init
    
    init(){
        super.init(nibName: nil, bundle: nil)
        setConstraints()
        title = "Vertical Stack"
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Set up

    private func setConstraints(){
        view.VScroll {
            HScroll {
                button1.withSquare(100)
                button2.withSquare(100)
                label.withSquare(100)
                label3.withSquare(100)
                label5.withSquare(100)
                label4.withSquare(100)
            }.withHeight(200)
            .spacing(20)
                        
            Spacer()
                .withHeight(100)
                .withBackground(.cyan)
            
            Spacer()
        }
    }
}
