//
//  GFButton.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa on 2/2/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Now build on default button
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor : UIColor , title : String)
    {
        super.init(frame : .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure()
    {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // This tells xcode to use autolayout
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func  set(backgroundColor : UIColor, title : String)
    {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
}
