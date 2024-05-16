//
//  AddHabitView.swift
//  HabitApp24
//
//  Created by Gamıd Khalıdov on 16.05.2024.
//

import SwiftUI

struct AddHabitView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var title = "Habit title"
    @State private var addDiscription = false
    @State private var description: String = ""
    
    var habits: Habits
    
    var body: some View {
        HabitPreviewCell(title: title, description: description)
        
        Form{
            
            Section("fill out habit data"){
                HStack {
                    TextField("Habit title", text: $title)
                        .font(.title)
                    .padding(5)
                    
                    Image(systemName: "pencil")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.green)
                        .font(.system(size: 30))
                        
                        
                    
                    
                    
                }
                if !addDiscription {
                    Button("Want to add discription?"){
                        addDiscription.toggle()
                    }
                } else {
                    HStack{
                        TextField("Discription", text: $description)
                        Button{
                            addDiscription.toggle()
                            description = ""
                        }label: {
                            Image(systemName: "minus")
                        }
                    }
                }
            }
            
        }
        .frame(height: 200)
        .scrollContentBackground(.hidden)
        .shadow(radius: 5)
        .scrollDisabled(true)
        
        Button{
            habits.arrOfHabits.insert(Habit(title: title, state: false, amountOfDone: 0, description: description), at: 0)
            dismiss()
        }label: {
            Text("Add Habit")
                .frame(width: 150, height: 50)
                .background(.blue)
                .foregroundStyle(.white)
                .font(.title2)
                .fontWeight(.bold)
                .clipShape(.rect(cornerRadius: 20))
        }
        
        Spacer()
    }
}

#Preview {
    AddHabitView(habits: Habits(arrOfHabits: []))
}

private struct HabitPreviewCell: View {
    
    
    var title: String
    var description = ""
    let numOfReps = 0
    let state = false
    
    var body: some View{
        VStack{
            HStack {
                VStack(){
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                    Text(description)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                        Text("Выполнено: \(numOfReps) раз")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.leading, 15)
                .padding(.top, 10)
                .padding(.bottom, 10)
                
                Spacer()

                Image(systemName: "checkmark.circle")
                    .font(.system(size: 50))
                    .padding(.horizontal)
                    .foregroundStyle(.green)
                
        }
        .frame(maxWidth: 400, maxHeight: 170)
        .background(.white.opacity(0.9))
        .clipShape(.rect(cornerRadius: 30))
        .padding([.top, .trailing, .leading])
        .shadow(radius: 10)
        
    }
    }
    
    
}
