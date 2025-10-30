//
//  AddTaskView.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @Environment(\.dismiss) var dismiss
    @State private var newTaskTitle = ""
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            Text("Add New Task")
                .font(.headline)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Input
            TextField("Enter task title", text: $newTaskTitle)
                .padding(14)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .foregroundColor(.black)
                .padding(.horizontal)
            
            // Add button
            Button(action: {
                guard !newTaskTitle.isEmpty else { return }
                viewModel.addTask(title: newTaskTitle)
                dismiss()
            })
            {
                Text("Add Task")
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .padding(14)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top, 16)
        .background(Color(.systemGray5).ignoresSafeArea())
        .presentationDetents([.fraction(0.25), .medium])
    }
}

#Preview {
    TaskListView()
}
