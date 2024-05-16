//
//  Habit.swift
//  HabitApp24
//
//  Created by Gamıd Khalıdov on 16.05.2024.
//

import Foundation

@Observable
class Habit: Identifiable{
    var title: String
    var state: Bool
    var numberOfReps: Int
    var description: String?
    
    init(title: String, state: Bool, amountOfDone: Int, description: String? = nil) {
        self.title = title
        self.state = state
        self.numberOfReps = amountOfDone
        self.description = description
    }
    
    
    
}
