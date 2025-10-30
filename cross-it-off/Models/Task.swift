//
//  Task.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}
