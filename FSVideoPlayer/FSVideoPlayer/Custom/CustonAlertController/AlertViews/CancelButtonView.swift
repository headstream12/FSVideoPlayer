//
//  CancelButtonView.swift
//  fschool_ios
//
//  Created by Rinat Yahin on 11/04/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

protocol CancelButtonViewDelegate: class {
    func didTapCancelButton()
}

final class CancelButtonView: UIView {

    private lazy var button: HighlightedButton = {
        let button = HighlightedButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        return button
    }()
    
    weak var delegate: CancelButtonViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
        
        button.backgroundColor = UIColor.AlertView.tintColor
    }
    
    @objc private func tapButton() {
        delegate?.didTapCancelButton()
    }
    
    func configureView(model: CustomAlertAction) {
        button.setTitle(model.title, for: .normal)
    }
}

final class HighlightedButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.Guides.dark
        }
    }
}

