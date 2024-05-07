//
//  RegisterView.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/6/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModal = RegisterViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(
                    title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange
                )
                
                //Register Form
                Form{
                    TextField("Full Name", text: $viewModal.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email Address", text: $viewModal.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $viewModal.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Create Account",
                             background: .green
                    ) {
                        //Attempt registration
                        
                        viewModal.register()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                Spacer()
            }
        }
        }
    }

#Preview {
    RegisterView()
}
