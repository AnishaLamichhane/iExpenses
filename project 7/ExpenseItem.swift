//
//  ExpenseItem.swift
//  project 7
//
//  Created by Anisha Lamichhane on 5/13/21.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name : String
    let type : String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
