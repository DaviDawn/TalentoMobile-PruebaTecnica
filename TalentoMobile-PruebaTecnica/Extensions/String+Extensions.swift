//
//  String+Extensions.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 14/2/22.
//

import Foundation

extension String {
    var localized: String {
        var localized = Bundle.main.localizedString(forKey: self, value: nil, table: nil)

        if localized == self {
            localized = Bundle.main.localizedString(forKey: self, value: nil, table: "Default")
        }
        return localized
    }
}
