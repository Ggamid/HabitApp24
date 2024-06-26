//
//  ContentView.swift
//  HabitApp24
//
//  Created by Gamıd Khalıdov on 16.05.2024.
//

import SwiftUI



struct ContentView: View {
    
    @State var habitModel: Habits = Habits(arrOfHabits: [])
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(habitModel.arrOfHabits, id: \.id){ habit in
                    NavigationLink{
                        DetailView(habit: habit, habits: habitModel)
                    } label:{
                        HabitCell(habit: habit)
                    }
                    
                    }

            }
            .navigationTitle("Habit")
            .background(.gray.opacity(0.2))
            .toolbar{
                NavigationLink{
                    AddHabitView(habits: habitModel)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


extension ContentView {
    func deleteHabit(indexSet: IndexSet){
        habitModel.arrOfHabits.remove(atOffsets: indexSet)
    }
}
