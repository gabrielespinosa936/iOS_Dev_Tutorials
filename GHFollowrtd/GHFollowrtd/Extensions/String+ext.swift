//
//  String+ext.swift
//  GHFollowrtd
//
//  Created by Gabriel Espinosa  on 2/14/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import Foundation

extension String
{
    func conertToDate() -> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    func convertToDisplayFormat() -> String
    {
        guard let date = self.conertToDate() else {return "N/A"}
        return date.convertToMonthYearFormat()
    }
}
