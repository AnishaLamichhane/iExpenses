//
//  ContentView.swift
//  project 7
//
//  Created by Anisha Lamichhane on 5/11/21.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
   
    
    var name : String
    var body: some View {
        Button("dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
@State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet){
            SecondView(name: "Anisha")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}