//
//  TaskListContentView.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import SwiftUI

struct TaskListContentView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var showCompletedTasks = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24){
                if !activeTasks.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        LazyVStack(spacing: 10){
                            ForEach(activeTasks) { task in
                                TaskRow(task: task, viewModel: viewModel)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                if !completedTasks.isEmpty {
                    HStack{
                        DisclosureGroup(isExpanded: $showCompletedTasks){
                            LazyVStack(spacing: 10) {
                                ForEach(completedTasks) { task in
                                    TaskRow(task: task, viewModel: viewModel)
                                }
                            }
                            .padding(.top, 8)
                            .padding(.horizontal)
                        } label: {
                            Text("Completed (\(completedTasks.count))")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                        .animation(.spring(duration: 0.45), value: showCompletedTasks)
                        Spacer(minLength: 8)
                    }
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .contentMargins(10)
                    .contentShape(Rectangle())
                }
            }
            .padding(.top,20)
        }
        .background(Color(.systemGray5).ignoresSafeArea())
    }
    
    private var activeTasks: [Task] {
        viewModel.tasks.filter{ !$0.isCompleted}
    }
    
    private var completedTasks: [Task] {
        viewModel.tasks.filter{$0.isCompleted}
    }
}


#Preview {
    TaskListView()
}
