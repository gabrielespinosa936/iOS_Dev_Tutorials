//
//  UIColor+Ext.swift
//  Timer_Tutorial
//
//  Created by Gabriel Espinosa  on 2/1/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor
    {
        let redVal : CGFloat = .random(in: 0...1)
        let greenVal : CGFloat = .random(in: 0...1)
        let blueVal : CGFloat = .random(in: 0...1)
        
        return UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1.0)
    }
}
