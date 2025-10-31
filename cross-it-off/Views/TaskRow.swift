//
//  TaskRow.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        HStack {
            Text(task.title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(task.isCompleted ? .gray.opacity(0.8) : .black)
                .strikethrough(task.isCompleted, color: .gray.opacity(0.7))
            
            Spacer()
            
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .gray : .black)
                .font(.system(size: 22))
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        .onTapGesture {
            withAnimation(.spring(duration: 0.35)) {
                viewModel.toggleCompletion(task: task)
            }
        }
    }
}
