//
//  CustomAlertController.swift
//  fschool_ios
//
//  Created by Rinat Yahin on 10/04/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

final class CustomActionSheetController: BaseAlertController {

    private var actions: [CustomAlertAction] = []
    private var titleString: String?
    private var cancelAction: CustomAlertAction?
    
    private let cellHeight: CGFloat = 60
    private let headerHeight: CGFloat = 48
    
    var tableBottomConstraint: NSLayoutConstraint?
    var containerBottomConstraint: NSLayoutConstraint?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 12
        tableView.layer.masksToBounds = true
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private lazy var backgroundButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        return button
    }()
    
    private lazy var cancelButton: CancelButtonView = {
        let cancelButton = CancelButtonView(frame: .zero)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.layer.cornerRadius = 12
        cancelButton.layer.masksToBounds = true
        return cancelButton
    }()
    
    private var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(title: String?){
        super.init(nibName: nil, bundle: nil)
        self.titleString = title
    }

    override var modalPresentationStyle: UIModalPresentationStyle {
        set {
            self.modalPresentationStyle = .custom
        }
        get {
            return UIModalPresentationStyle.custom
        }
    }
    
    override var transitioningDelegate: UIViewControllerTransitioningDelegate? {
        set {
            self.transitioningDelegate = AlertControllerTransition()
        }
        get {
            return AlertControllerTransition()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContainerView()
        setupViews()
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showActionSheet()
    }
    
    private func setupContainerView() {
        view.addSubview(backgroundButton)
        view.addSubview(containerView)
        
        containerBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: calculateContainerViewHeight())
        containerBottomConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.heightAnchor.constraint(equalToConstant: calculateContainerViewHeight())
            ])
        
        NSLayoutConstraint.activate([
            backgroundButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundButton.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    private func showActionSheet() {
        
        containerBottomConstraint?.isActive = false
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.containerBottomConstraint =
                self.containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
            
            self.containerBottomConstraint?.isActive = true
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    private func hideActionSheet() {
        
        containerBottomConstraint?.isActive = false

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.containerBottomConstraint =
                self.containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.calculateContainerViewHeight())
            
            self.containerBottomConstraint?.isActive = true
            self.view.layoutIfNeeded()
            
        }) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .clear
        
        containerView.addSubview(tableView)
        
        tableView.register(CustomAlertTableViewCell.self,
                           forCellReuseIdentifier: CustomAlertTableViewCell.cellReuseIdentifier())
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8),
            tableView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8),
            tableView.heightAnchor.constraint(equalToConstant: calculateTableViewHeight())
            ])
    }
    
    private func configureLayout() {
        if let action = cancelAction {
            containerView.addSubview(cancelButton)
            
            tableBottomConstraint = tableView.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -6)
            tableBottomConstraint?.isActive = true
            
            NSLayoutConstraint.activate([
                cancelButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8),
                cancelButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8),
                cancelButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
                cancelButton.heightAnchor.constraint(equalToConstant: cellHeight),
                ])
            
            cancelButton.delegate = self
            cancelButton.configureView(model: action)
            
        } else {
            tableBottomConstraint = tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
            tableBottomConstraint?.isActive = true
        }
    }
    
    @objc private func tapOnView() {
        hideActionSheet()
    }
    
    private func calculateTableViewHeight() -> CGFloat {
        var height: CGFloat = 0
        for action in actions {
            if action.style != .cancel {
                height += cellHeight
            }
        }
        if let _ = titleString {
            height += headerHeight
        }
        return height
    }
    
    private func calculateContainerViewHeight() -> CGFloat {
        var height: CGFloat = calculateTableViewHeight() + 8 //bottom offset
        if let _ = cancelAction {
            height += 70 //cell(60) + offset between(10)
        }
        return height
    }
    
    override func addAction(action: CustomAlertAction) {
        if action.style == .cancel {
            cancelAction = action
            return
        }
        actions.append(action)
    }    
}

extension CustomActionSheetController: UITableViewDelegate, UITableViewDataSource {
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomAlertTableViewCell.cellReuseIdentifier()) as! CustomAlertTableViewCell
        
        cell.configureCellWithModel(model: actions[indexPath.row])
        if indexPath.row == actions.count - 1 {
            cell.separatorLine.isHidden = true
        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let _ = titleString {
            return headerHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomAlertHeaderView.cellReuseIdentifier()) as? CustomAlertHeaderView ?? CustomAlertHeaderView(reuseIdentifier: CustomAlertHeaderView.cellReuseIdentifier())
    
        header.configureHeader(title: titleString)
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let action = actions[indexPath.row]
        action.handler?(action)
        hideActionSheet()
    }
    
}

extension CustomActionSheetController: CancelButtonViewDelegate {
    func didTapCancelButton() {
        hideActionSheet()
    }
}

