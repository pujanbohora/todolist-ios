//
//  NewItemView.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//


import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 25))
                .bold()
                .padding(.top, 10)
            
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                TLButton(title: "Save",
                         background: .pink
                ){
                    if viewModel.canSave {
                    viewModel.save()
                    newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message:  Text("Please fill in all fields and select due date that is today or newer."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}

