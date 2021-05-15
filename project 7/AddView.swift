//
//  AddView.swift
//  project 7
//
//  Created by Anisha Lamichhane on 5/13/21.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses : Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    static let types = ["Personal", "Business"]
    
//    Challenge 3
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(Self.types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)

            }
            .navigationBarTitle("Add new Expenses")
            
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
//                    Challenge 3
                    wordError(title: "Not integer", message: "Please use integer value for this field.")
                }
            })
//            Challenge 3
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}
    
//    Challenge 3
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
        
    }
}
    

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}

