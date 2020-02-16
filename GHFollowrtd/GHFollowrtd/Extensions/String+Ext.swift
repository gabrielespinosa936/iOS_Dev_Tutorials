//
//  String+Ext.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa on 2/15/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import Foundation

extension String
{
    func convertToDate() -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplatFormat() -> String
    {
        guard let date = self.convertToDate() else {return "N/A"}
        return date.convertToMonthYearFormat()
    }
}
