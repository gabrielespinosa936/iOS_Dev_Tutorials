//
//  ViewController.swift
//  Timer_Tutorial
//
//  Created by Gabriel Espinosa  on 2/1/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let counterLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .random()
    }
    
    func configureLabel()
    {
        view.addSubview(counterLabel)
        
        counterLabel.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        counterLabel.textAlignment = .center
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counterLabel.heightAnchor.constraint(equalToConstant: 300),
            counterLabel.widthAnchor.constraint(equalToConstant: 300)
        
        ])
    }


}

