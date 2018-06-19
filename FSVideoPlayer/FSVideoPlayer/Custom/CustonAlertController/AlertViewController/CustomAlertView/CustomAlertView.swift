//
//  CustomAlertView.swift
//  fschool_ios
//
//  Created by Rinat Yakhin on 03/05/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

protocol CustomAlertViewDelegate: class {
    func didTapButton(action: CustomAlertAction)
}

final class CustomAlertView: UIView {
    
    weak var delegate: CustomAlertViewDelegate?
    
    private var alertBuilder: AlertButtonBuilder?
    private var textBuilder: TextAlertBuilder?

    private lazy var alertView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.AlertView.tintColor
        return view
    }()
    
    private lazy var horizontalSeparatorLine: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.AlertView.separatorLine
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        alertView.layer.cornerRadius = 8
        alertView.layer.masksToBounds = true
        
        createAlertContainer()
        alertBuilder = AlertButtonBuilder(container: alertView)
        alertBuilder?.delegate = self
        textBuilder = TextAlertBuilder(container: alertView)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createAlertContainer() {
        addSubview(alertView)
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: centerYAnchor),
            alertView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65)
            ])
    }
    
    private func setupViews() {
        guard let alert = alertBuilder, let text = textBuilder else {
            return
        }
        
        addSubview(horizontalSeparatorLine)

        NSLayoutConstraint.activate([
            text.stackView.bottomAnchor.constraint(equalTo: alert.stackView.topAnchor, constant: 0),
            
            horizontalSeparatorLine.leftAnchor.constraint(equalTo: alertView.leftAnchor),
            horizontalSeparatorLine.rightAnchor.constraint(equalTo: alertView.rightAnchor),
            horizontalSeparatorLine.heightAnchor.constraint(equalToConstant: 1),
            horizontalSeparatorLine.topAnchor.constraint(equalTo: alert.stackView.topAnchor)
            ])
    }
    
    func invalidateSize() {
        guard let alert = alertBuilder, let text = textBuilder else {
            return
        }
        
        let height = text.intrinsicContentSize() + alert.intrinsicContentSize()
        
        NSLayoutConstraint.activate([
            text.stackView.heightAnchor.constraint(equalToConstant: text.intrinsicContentSize()),
            alert.stackView.heightAnchor.constraint(equalToConstant: alert.intrinsicContentSize()),
            
            alertView.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
            ])
        
        layoutIfNeeded()
    }
    
    func setTitle(string: String) {
        textBuilder?.setTitle(string: string)
    }
    
    func setMessage(string: String) {
        textBuilder?.setMessage(string: string)
    }
    
    func configureAlertView(actions: [CustomAlertAction]) {
        alertBuilder?.setAcions(actions: actions)
    }
}

extension CustomAlertView: AlertButtonBuilderDelegate {
    func didTapButton(action: CustomAlertAction) {
        delegate?.didTapButton(action: action)
    }    
}
