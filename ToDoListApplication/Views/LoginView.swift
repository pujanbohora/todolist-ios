//
//  LoginView.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/5/24.
//


import SwiftUI

struct LoginView : View {
    @StateObject var viewModel = LoginViewViewModel()
   
    var body: some View{
        
        NavigationView{
            VStack{
                //Header
                
                HeaderView(
                    title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink
                )
                
                //Login Form
                Form{
                    if !viewModel.errorMesssage.isEmpty{
                        Text(viewModel.errorMesssage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                             background: .blue
                    ) {
                        //Attempt Login
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
//                Spacer()
                
                //Create Account
                
                VStack{
                    Text("New around here?")
//                    Button("Create An Account"){
//                     //Show registration
//                    }
                    NavigationLink("Create An Account", 
                                   destination: RegisterView())
                }.padding(.bottom, 50)
                
                Spacer()
                
            }
        }
        }
}

#Preview {
    LoginView()
}

