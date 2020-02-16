//
//  Date+Ext.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa on 2/15/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import Foundation


extension Date
{
    func convertToMonthYearFormat() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
