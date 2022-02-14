//
//  Date+Extensions.swift
//  TalentoMobile-PruebaTecnica
//
//  Created by Alba Domingo, David on 14/2/22.
//

import Foundation

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
