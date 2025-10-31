//
//  TaskViewModel.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
//    @Published var tasks: [Task] = [
//        Task(title: "1 hour Coding", isCompleted: false),
//        Task(title: "Read 20 pages", isCompleted: true),
//        Task(title: "1 hour Workout", isCompleted: false)
//    ]
    @Published var tasks: [Task] = [] {
        didSet {
            saveTasks()
        }
    }
    
//    App storage
    @AppStorage("tasks") private var storedTasksData: Data = Data()
    
    
    init(){
        loadTasks()
    }
    
    // adding a task
    func addTask(title: String){
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedTitle.isEmpty else { return } // light error handling
        
        let newTask = Task(title: trimmedTitle, isCompleted: false)
        tasks.append(newTask)
    }
    
    //complete task
    func toggleCompletion(task:Task) {
        withAnimation(.spring(duration: 0.25)) {
            if let index = tasks.firstIndex(where: {$0.id == task.id}){
                tasks[index].isCompleted.toggle()
            }
        }
    }
    
    
    // Data and Persistence
    private func saveTasks() {
        do {
            let data = try JSONEncoder().encode(tasks)
            storedTasksData = data
        } catch {
            print("Error saving tasks: \(error)")
        }
    }
    
    private func loadTasks(){
        do {
            let decoded = try JSONDecoder().decode([Task].self, from: storedTasksData)
            tasks = decoded
        } catch {
            tasks = [] // default to empty
        }
    }
    
}
