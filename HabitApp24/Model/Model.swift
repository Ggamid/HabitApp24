//
//  Model.swift
//  HabitApp24
//
//  Created by Gamıd Khalıdov on 16.05.2024.
//

import Foundation

@Observable
class Habits {
    var arrOfHabits = [Habit]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(arrOfHabits){
                UserDefaults.standard.set(encoded, forKey: "arrOfHabits")
            }
        }
    }
    
    init(arrOfHabits: [Habit]) {
        if let data = UserDefaults.standard.data(forKey: "arrOfHabits"){
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data){
                self.arrOfHabits = decoded
                return
            }
        }
        self.arrOfHabits = [.init(title: "Drin Water 💧", state: true, amountOfDone: 0, description: "Drink water 7 times per day")]
    }
    
    func deleteHabit(id: ObjectIdentifier){
        for i in 0..<arrOfHabits.count {
            if arrOfHabits[i].id == id{
                arrOfHabits.remove(at: i)
                return
            }
        }
    }
    
    func refactorHabit(id: ObjectIdentifier, habit: Habit){
        for i in 0..<arrOfHabits.count{
            if arrOfHabits[i].id == id{
                arrOfHabits[i] = habit
                return
            }
        }
    }
}

