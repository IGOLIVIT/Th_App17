//
//  DateConvert.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
