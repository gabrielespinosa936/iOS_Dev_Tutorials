//
//  ViewController.swift
//  Gesture_Tutorial
//
//  Created by Gabriel Espinosa  on 2/1/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomBackgroundColor()
        
    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 0.4)
        {
            self.randomBackgroundColor()
        }
    }
    
    func randomBackgroundColor()
    {
        view.backgroundColor = .random()
    }
}

