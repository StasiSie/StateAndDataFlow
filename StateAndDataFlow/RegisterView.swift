//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            UsernameTF(name: $userManager.user.name, nameIsValid: userManager.isNameValid)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.disabled(!userManager.isNameValid)
        }.padding()
    }
}

extension RegisterView {
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            DataManager.shared.saveUserData(userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct UsernameTF: View {
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack{
                Spacer()
                Text("\(name.count)")
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
        }
    }
}
