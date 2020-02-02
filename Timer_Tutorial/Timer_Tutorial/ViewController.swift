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
    var timer : Timer!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .random()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(incrementCountLabel), userInfo: nil, repeats: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5)
        {
            self.timer.invalidate()
        }
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        timer.invalidate()
//    }
    
    @objc func changeBackground()
    {
        view.backgroundColor = .random()
        
    }
    @objc func incrementCountLabel()
    {
        count += 1
        counterLabel.text = String(count)
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

