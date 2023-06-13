//
//  WeekStore.swift
//  PetBuddy-iOS
//
//  Created by Kasper Spychala on 13/06/2023.
//

import Foundation
import SwiftUI

class WeekManager: ObservableObject {
    // Combined of all Weeks
    @Published var allWeeks: [WeekValue] = []

    // Current chosen date indicator
    @Published var currentDate: Date = Date()

    // Array of Weeks
    @Published var currentWeek: [Date] = []
    @Published var nextWeek: [Date] = []
    @Published var previousWeek: [Date] = []

    // Initial append of weeks
    init() {
        fetchCurrentWeek()
        fetchPreviousNextWeek()
        appendAll()
    }

    func appendAll() {
        var newWeek = WeekValue(id: 0, date: previousWeek)
        allWeeks.append(newWeek)

        newWeek = WeekValue(id: 1, date: currentWeek)
        allWeeks.append(newWeek)

        newWeek = WeekValue(id: 2, date: nextWeek)
        allWeeks.append(newWeek)
    }

    func update(dragDirection: DragDirection) {
        switch dragDirection {
        case .left:
            allWeeks[0].date = allWeeks[1].date
            allWeeks[1].date = allWeeks[2].date
            currentDate = allWeeks[1].date[0]
            addWeek(index: 2, value: 1)
        case .right:
            allWeeks[2].date = allWeeks[1].date
            allWeeks[1].date = allWeeks[0].date
            currentDate = allWeeks[1].date[0]
            addWeek(index: 0, value: -1)
        case .none:
            break
        }
    }

    func addWeek(index: Int, value: Int) {
        allWeeks[index].date.removeAll()
        var calendar = Calendar(identifier: .gregorian)
        let today = Calendar.current.date(byAdding: .day, value: 7 * value , to: self.currentDate)!
        self.currentDate = today

        calendar.firstWeekday = 7
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!

        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek){
                allWeeks[index].date.append(weekday)
            }
        }
    }

    func isToday(date: Date)->Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDate, inSameDayAs: date)
    }


    func dateToString(date: Date, format: String)->String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }

    func fetchCurrentWeek() {
        let today = currentDate

        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 7

        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: today))!

        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeek){
                currentWeek.append(weekday)
            }
        }
    }

    func fetchPreviousNextWeek(){
        nextWeek.removeAll()
        let nextWeekToday = Calendar.current.date(byAdding: .day, value: 7, to: currentDate )!

        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 7

        let startOfWeekNext = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: nextWeekToday))!

        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekNext){
                nextWeek.append(weekday)
            }

        }

        previousWeek.removeAll()
        let previousWeekToday = Calendar.current.date(byAdding: .day, value: -7, to: currentDate)!

        let startOfWeekPrev = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: previousWeekToday))!

        (1...7).forEach{ day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: startOfWeekPrev){
                previousWeek.append(weekday)
            }
        }
    }
}
