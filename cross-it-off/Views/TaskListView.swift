//
//  TaskListView.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//
import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        if task.isCompleted {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            .navigationTitle("Check It Off ✅")
        }
    }
}

#Preview {
    TaskListView()
}
