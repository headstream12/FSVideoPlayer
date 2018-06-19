//
//  CustomAlertViewController.swift
//  fschool_ios
//
//  Created by Rinat Yahin on 28/04/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

class CustomAlertViewController: BaseAlertController{
    
    private var actions: [CustomAlertAction] = []
    private var titleString: String?
    private var messageString: String?
    
    lazy var rootView: CustomAlertView = {
        let view = CustomAlertView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.AlertView.background
        view.delegate = self
        return view
    }()
    
    init(title: String?, message: String?){
        super.init(nibName: nil, bundle: nil)
        self.titleString = title
        self.messageString = message
        setupViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureAlertView()
        
        automaticallyAdjustsScrollViewInsets = false
    }
    
    private func configureAlertView() {
        rootView.configureAlertView(actions: actions)
        
        if let string = titleString {
            rootView.setTitle(string: string)
        }
        
        if let message = messageString {
            rootView.setMessage(string: message)
        }
        
        rootView.invalidateSize()
    }

    private func setupViewController() {
        self.definesPresentationContext = true
        self.providesPresentationContextTransitionStyle = true
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }
    
    private func setupViews() {
        view.addSubview(rootView)
        
        NSLayoutConstraint.activate([
            rootView.leftAnchor.constraint(equalTo: view.leftAnchor),
            rootView.topAnchor.constraint(equalTo: view.topAnchor),
            rootView.rightAnchor.constraint(equalTo: view.rightAnchor),
            rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    override func addAction(action: CustomAlertAction) {
        actions.append(action)
    }
}

extension CustomAlertViewController: CustomAlertViewDelegate {
    func didTapButton(action: CustomAlertAction) {
        self.dismiss(animated: true) {
            action.handler?(action)
        }
    }
}
