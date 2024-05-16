//
//  Model.swift
//  HabitApp24
//
//  Created by Gamıd Khalıdov on 16.05.2024.
//

import Foundation

@Observable
class Habits {
    var arrOfHabits: [Habit]
    
    init(arrOfHabits: [Habit]) {
        if !arrOfHabits.isEmpty{
            self.arrOfHabits = arrOfHabits
        } else {
            self.arrOfHabits = [.init(title: "Drink Water 💧", state: false, amountOfDone: 7, description: "Drink cup of water 7 times per day."),
                .init(title: "Training 🏋🏻", state: true, amountOfDone: 1, description: "Go to GYM"),
                                .init(title: "Read Quran 📖", state: false, amountOfDone: 20),
                .init(title: "Go for a walk 🚶🏻‍♂️", state: false, amountOfDone: 5, description: "Go for a walk every day.")
            ]
        }
    }
}
