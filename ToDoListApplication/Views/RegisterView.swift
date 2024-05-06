//
//  RegisterView.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/6/24.
//

import SwiftUI

struct RegisterView: View {
    
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(
                    title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange
                )
                
                //Register Form
                Form{
                    TextField("Full Name", text: $name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Create Account",
                             background: .green
                    ) {
                        //Attempt registration
                        print("Button is clicked")
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
