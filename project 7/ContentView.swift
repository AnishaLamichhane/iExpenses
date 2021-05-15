//
//  ContentView.swift
//  project 7
//
//  Created by Anisha Lamichhane on 5/11/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List {
// this tells the forEach to identify expenses.items  uniquely by its id, then prints the name out in each row
                ForEach(expenses.items){ item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(self.color(amount: item.amount))  // challenge 2
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpenses")
//            Challenge 1
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
//                the below two lines is for to check the list working properly or not
//                let expense = ExpenseItem(name: "Test", type: "personal", amount: 5)
//                self.expenses.items.append(expense)
                self.showingAddExpense = true
            })
            {
//              inside the button
                Image(systemName: "plus")
            }
            )
            
            .sheet(isPresented: $showingAddExpense) {
//                show an AddView here
                AddView(expenses: self.expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
//    challenge 2
    
    func color(amount: Int) -> Color {
        switch amount {
        case Int.min ..< 10:
            return .green
            
        case 10 ..< 100:
            return .purple
        default:
            return .red
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
