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
                Button {
                    showAddTask = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.black)
                        .shadow(radius: 4)
                }
                .padding()
            }
        }
    }
}
