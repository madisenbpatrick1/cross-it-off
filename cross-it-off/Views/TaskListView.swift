//
//  TaskListView.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//
import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var showAddTask = false
    
    var body: some View {
        NavigationView {
            ZStack {
                TaskListContentView(ViewModel: viewModel)
                
                FloatingAddButton(showAddTask: $showAddTask)
            }
            .sheet(isPresented: $showAddTask) {
                AddTaskView(viewModel: viewModel)
            }
            .navigationTitle("Check It Off ✅")
        }
    }
}

#Preview {
    TaskListView()
}
