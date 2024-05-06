//
//  TLButton.swift
//  ToDoListApplication
//
//  Created by Pawan Bohora on 5/6/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void // Closure Function
    
    var body: some View {
        Button{
            //Attempt log in
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }

    }
}

#Preview {
    TLButton(title: "Value", background: .pink) {
        //Action Button
    }
}
