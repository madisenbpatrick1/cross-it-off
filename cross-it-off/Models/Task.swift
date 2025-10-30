//
//  Task.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import Foundation

// Codable - allows it to be easily encoded/decoded
struct Task: Identifiable, Codable {
    var id = UUID() // user id unique
    let title: String
    var isCompleted: Bool
}
