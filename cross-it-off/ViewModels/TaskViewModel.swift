//
//  TaskViewModel.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "1 hour Coding", isCompleted: false),
        Task(title: "Read 20 pages", isCompleted: true),
        Task(title: "1 hour Workout", isCompleted: false)
    ]
}
