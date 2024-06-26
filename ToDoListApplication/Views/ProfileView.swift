//
//  ProfileView.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = viewModel.user {
                    profile(user: user)
                }
                else {
                    Text("Loading Profile...")
//                    Image(systemName: "person.circle")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        //Info: Name, Email, Member Since
        VStack(alignment: .leading, content: {
            HStack {
                Text("Name: ")
                    .bold()
                Text("\(user.name)")
            }.padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text("\(user.email) ")
            }.padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened)) ")
            }.padding()
        })
        
        Button("Log Out") {
            viewModel.logOut()
        }.padding()
        
        Spacer()
    }
    
}

#Preview {
    ProfileView()
}

