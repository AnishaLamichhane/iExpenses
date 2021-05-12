//
//  ContentView.swift
//  project 7
//
//  Created by Anisha Lamichhane on 5/11/21.
//

import SwiftUI
class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Roe"
}

struct ContentView: View {
@ObservedObject var user = User()
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First Name :", text: $user.firstName)
            TextField("Last Name :", text: $user.lastName)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
