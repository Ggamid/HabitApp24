//
//  HabitCell.swift
//  HabitApp24
//
//  Created by Gamıd Khalıdov on 16.05.2024.
//

import SwiftUI

struct HabitCell: View {
    @State var habit: Habit
    @State var haha = 1
    
    var body: some View {

            VStack{
                HStack {
                    VStack(){
                        Text(habit.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                        Text(habit.description ?? "")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Spacer()
                            Text("Выполнено: \(habit.numberOfReps) раз")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.leading, 15)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    
                    Spacer()
                    Button{
                        print("Hey")
                        habit.state.toggle()
                    } label: {
                        Image(systemName: habit.state ? "checkmark.circle.fill" : "checkmark.circle")
                            .font(.system(size: 50))
                            .padding(.horizontal)
                            .foregroundStyle(.green)
                            .animation(.bouncy(extraBounce: 10), value: haha)
                    }
                    
                    
                }
            }
            .frame(maxWidth: 400, maxHeight: 200)
            .background(.white.opacity(0.9))
            .clipShape(.rect(cornerRadius: 30))
            .padding([.top, .trailing, .leading])
            .shadow(radius: 10)
            
        }
}

#Preview {
    HabitCell(habit: .init(title: "Drink Water 💧",
                           state: false,
                           amountOfDone: 7,
                           description: "Drink water 5 time per day."))
}
