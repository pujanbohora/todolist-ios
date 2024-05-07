//
//  ToDoListView.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        //users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                //Delete
                            } label: {
                                Text("Delete")
                                    .foregroundColor(Color.red)
                            }
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView( newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
