//
//  TaskListContentView.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import SwiftUI

struct TaskListContentView: View {
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) { // cleaner spacing than List
                ForEach(viewModel.tasks) { task in
                    HStack {
                        Text(task.title)
                            .font(.system(size: 18))
                            .foregroundColor(task.isCompleted ? .gray : .black)
                            .strikethrough(task.isCompleted, color: .gray)
                        
                        Spacer()
                        
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .gray : .black)
                            .font(.system(size: 22))
                    }
                    .padding(.vertical, 14)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.spring(duration: 0.45)){
                            viewModel.toggleCompletion(task: task)
                        }
                    }
                }
            }
            .padding(.top, 12)
            .padding(.horizontal)
        }
        .background(Color(.systemGray5).ignoresSafeArea()) // subtle page background
    }
}


#Preview {
    TaskListView()
}
