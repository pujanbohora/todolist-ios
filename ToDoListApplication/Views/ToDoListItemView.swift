//
//  ToDoListItemView.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                           Text(item.title)
                               .font(.system(size: 20))
                           Text("\(Date(timeIntervalSince1970 : item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                               .font(.system(size: 15))
                               .foregroundColor(Color(.secondaryLabel))
                       }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(
        item: .init(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
    )
}

