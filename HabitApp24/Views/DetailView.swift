//
//  DetailView.swift
//  HabitApp24
//
//  Created by Gamıd Khalıdov on 17.05.2024.
//

import SwiftUI

struct DetailView: View {
    var habit: Habit
    
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    @State private var amountOfReps = 0
    @State private var state = false
    
    var habits: Habits
    
    var body: some View {
    
        NavigationStack{
            Form{
                HStack{
                    TextField(title, text: $title)
                        .font(.title)
                        .fontWeight(.heavy)
                    Image(systemName: "pencil")
                        .font(.system(size: 25))
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                
                HStack{
                    TextField(description, text: $description)
                        .font(.title3)
                        .fontWeight(.light)
                    Image(systemName: "pencil")
                        .font(.system(size: 25))
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                
                HStack{
                    Stepper("amount of reps: \(amountOfReps)", value: $amountOfReps, in: 0...100)
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                
                Toggle(isOn: $state, label: {Text("today state:")})
                
            }.onAppear{
                title = habit.title
                description = habit.description ?? ""
                amountOfReps = habit.numberOfReps
                state = habit.state
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Habit detail")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button{
                        dismiss()
                    }label: {
                        Text("Cancel")
                    }
                }
                if title != habit.title || description != habit.description || amountOfReps != habit.numberOfReps || state != habit.state{
                    ToolbarItem(placement: .confirmationAction){
                        Button{
                            habits.refactorHabit(id: habit.id, habit: .init(title: title, state: state, amountOfDone: amountOfReps, description: description))
                            dismiss()
                        }label: {
                            Text("Edit")
                        }
                    }
                }
            }
            
            Button("Delete habit"){
                habits.deleteHabit(id: habit.id)
                dismiss()
            }.foregroundStyle(.red)
        }
    }
}

#Preview {
    DetailView(habit: .init(title: "Drink water 💧", state: false, amountOfDone: 0, description: "some discrip"), habits: Habits(arrOfHabits: []))
}
