//
//  ContentView.swift
//  project 7
//
//  Created by Anisha Lamichhane on 5/11/21.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            List {
// this tells the forEach to identify expenses.items  uniquely by its name, then prints the name out as its row
                ForEach(expenses.items, id: \.name){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpenses")
            .navigationBarItems(trailing: Button(action: {
                let expense = ExpenseItem(name: "Test", type: "personal", amount: 5)
                self.expenses.items.append(expense)
            })
            {
//              inside the button
                Image(systemName: "plus")
            }
            )
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
