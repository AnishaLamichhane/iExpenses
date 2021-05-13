//
//  ContentView.swift
//  project 7
//
//  Created by Anisha Lamichhane on 5/11/21.
//

import SwiftUI


struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap Count \(tapCount)") {
            self.tapCount += 1
            
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
