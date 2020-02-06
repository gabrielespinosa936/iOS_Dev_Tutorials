//
//  GFAlertVC.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/5/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = UIView()
    let titleLable = GFTitleLable(textAlighnment: .center, fontSize: 20)
    let messageLable = GFBodyLabel(textAlighnment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var buttonTitle : String?
    var message : String?
    var alertTitle : String?
    
    var padding : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainer()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    
    init(title : String, message : String, buttonTitle : String)
    {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContainer()
    {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        
        ])
    }
    
    func configureTitleLabel()
    {
        view.addSubview(titleLable)
        titleLable.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLable.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    func configureActionButton()
    {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
    @objc func dismissVC()
    {
        dismiss(animated: true)
    }
    
    func configureMessageLabel()
    {
        containerView.addSubview(messageLable)
        messageLable.text = message ?? "Unable to complete request"
        messageLable.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 8),
            messageLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLable.bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: -12)
        ])
    }
}
