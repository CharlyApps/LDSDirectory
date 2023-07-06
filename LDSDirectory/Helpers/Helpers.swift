//
//  Helpers.swift
//  LDSDirectory
//
//  Created by Carlos Bastida on 7/5/23.
//

import Foundation
import SwiftUI

func getColor(affiliation: Affiliation) -> Color {
    switch affiliation {
        case .jedi:
            return .green
        case .sith:
            return .red
        case .rebel:
            return .blue
        case .empire:
            return .orange
        case .na:
            return .white
    }
}

func getForceType(affiliation: Affiliation) -> String {
    switch affiliation {
    case .jedi, .rebel:
            return "light side"
    case .sith, .empire:
            return "dark side"
        default:
            return ""
    }
}

func formatDate(dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if let date = dateFormatter.date(from: dateString) {
        dateFormatter.dateFormat = "MMMM, dd, yyyy"
        return dateFormatter.string(from: date)
    }
    return "Jan, 01, 2000"
}
