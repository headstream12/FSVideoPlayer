//
//  CustomAlertTableViewCell.swift
//  fschool_ios
//
//  Created by Rinat Yahin on 11/04/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

final class CustomAlertTableViewCell: UITableViewCell {
    
    var textLabelColor: UIColor?
    var backgroundSheetColor: UIColor?
    var separatorLineColor: UIColor?
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 21)
        return label
    }()
    
    lazy var separatorLine: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.Guides.white05
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func cellReuseIdentifier() -> String {
        return "CustomAlertTableViewCell"
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
        
        backgroundColor = UIColor.AlertView.tintColor
        
        let colorView = UIView()
        colorView.backgroundColor = UIColor.gray
        selectedBackgroundView = colorView
    }
    
    func configureCellWithModel(model: CustomAlertAction) {
        label.text = model.title
    }
}
