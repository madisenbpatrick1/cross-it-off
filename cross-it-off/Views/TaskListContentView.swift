//
//  TaskListContentView.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import SwiftUI

struct TaskListContentView: View {
    @ObservedObject var ViewModel: TaskViewModel
    
    var body: some View {
        List {
            ForEach(ViewModel.tasks) {task in
                HStack {
                    Text(task.title)
                    Spacer()
                    if task.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
//                .onTapGesture {
//                    viewModel.toggleCompletion(task: task)
//                }
            }
        }
    }
}
