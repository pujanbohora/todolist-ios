//
//  ContentView.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModal = MainViewViewModel()
    
    var body: some View {
        if viewModal.isSignedIn, !viewModal.currentUserId.isEmpty {
            //signed in
            accountView
           
        } else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModal.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Person", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
