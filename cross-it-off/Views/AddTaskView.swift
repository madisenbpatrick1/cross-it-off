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
            Text("Add New Task")
                .font(.headline)

            TextField("Enter task title", text: $newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Add Task") {
                if !newTaskTitle.isEmpty {
                    viewModel.addTask(title: newTaskTitle)
                    dismiss()
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer()
        }
        .presentationDetents([.fraction(0.25), .medium])
    }
}
