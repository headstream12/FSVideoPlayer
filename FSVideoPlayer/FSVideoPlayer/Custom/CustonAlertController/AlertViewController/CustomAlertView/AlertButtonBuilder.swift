//
//  AlertButtonBuilder.swift
//  fschool_ios
//
//  Created by Rinat Yakhin on 04/05/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

protocol AlertButtonBuilderDelegate: class {
    func didTapButton(action: CustomAlertAction)
}

final class AlertButtonBuilder {
    
    weak var delegate: AlertButtonBuilderDelegate?
    private let buttonHeight: CGFloat = 44
    private var actions: [CustomAlertAction]? {
        didSet {
            guard let actions = actions else {
                return
            }
            
            switch actions.count {
            case 1 ... 2:
                stackView.axis = .horizontal
            default:
                stackView.axis = .vertical
            }
        }
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.addBackground(color: UIColor.AlertView.separatorLine)
        return stackView
    }()
    
    private lazy var backgoundView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.AlertView.separatorLine
        return view
    }()
    
    init(container: UIView) {
        container.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: container.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: container.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            ])
    }
    
    private func setButton(action: CustomAlertAction, index: Int) {
        let button = createButton(action: action, tag: index)
        stackView.addArrangedSubview(button)
    }
    
    private func createButton(action: CustomAlertAction, tag: Int) -> UIButton {
        let button = AlertButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = tag
        button.setTitle(action.title, for: .normal)
        button.backgroundColor = UIColor.AlertView.tintColor
        button.setTitleColor(UIColor.AlertView.buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        return button
    }
    
    @objc private func tapButton(sender: UIButton) {
        guard let actions = self.actions else {
            return
        }
        
        let action = actions[sender.tag]
        
        delegate?.didTapButton(action: action)
    }
    
    func setAcions(actions: [CustomAlertAction]) {
        self.actions = actions
        
        for (index, action) in actions.enumerated() {
            setButton(action: action, index: index)
        }
    }
    
    func intrinsicContentSize() -> CGFloat {
        guard let actions = self.actions else {
            return 0
        }
        if actions.count <= 2 {
            return buttonHeight
        }
        
        var height: CGFloat = 0
        for _ in actions {
            height += buttonHeight
        }
        return height
    }
}

final class AlertButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.AlertView.tintColor
        }
    }
}
