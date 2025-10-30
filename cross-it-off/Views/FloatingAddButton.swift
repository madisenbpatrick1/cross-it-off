//
//  FloatingAddButton.swift
//  cross-it-off
//
//  Created by Madisen Patrick on 10/30/25.
//

import SwiftUI

struct FloatingAddButton: View {
    @Binding var showAddTask: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button (action: {
                    showAddTask = true
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60, height: 60)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        Image(systemName: "plus")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    TaskListView()
}

