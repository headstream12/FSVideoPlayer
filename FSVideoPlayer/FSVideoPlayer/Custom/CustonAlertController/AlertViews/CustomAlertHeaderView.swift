//
//  CustomAlertHeaderView.swift
//  fschool_ios
//
//  Created by Rinat Yahin on 11/04/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

final class CustomAlertHeaderView: UITableViewHeaderFooterView {
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.Guides.white30
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var separatorLine: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.Guides.white05
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(label)
        addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        
        NSLayoutConstraint.activate([
            separatorLine.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            separatorLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            separatorLine.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            separatorLine.heightAnchor.constraint(equalToConstant: 1.0)
            ])
        
        contentView.backgroundColor = UIColor.AlertView.tintColor
    }
    
    class func cellReuseIdentifier() -> String {
        return "CustomAlertHeaderView"
    }
    
    func configureHeader(title: String?) {
        label.text = title
    }
}
