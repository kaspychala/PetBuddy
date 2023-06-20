//
//  CalendarWeekView.swift
//  PetBuddy
//
//  Created by Kasper Spychala on 03/05/2023.
//

import SwiftUI

struct CalendarWeekView: View {
    @StateObject var weekManager = WeekManager()
    @State private var dragDirection: DragDirection = .none
    @State private var item0Offset = -UIScreen.main.bounds.width
    @State private var item1Offset = 0.0
    @State private var item2Offset = UIScreen.main.bounds.width
    private var animationDuration = 0.15

    var body: some View {
        ZStack {
            ForEach(weekManager.allWeeks) { week in
                VStack{
                    HStack {
                        ForEach(0..<7) { index in
                            VStack(spacing: 20) {
                                Text(weekManager.dateToString(date: week.date[index], format: "EEE"))
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)

                                if weekManager.dateToString(date: weekManager.tappedDate, format: "dd-MM-YYYY")
                                    == weekManager.dateToString(date: week.date[index], format: "dd-MM-YYYY") {
                                    Text(weekManager.dateToString(date: week.date[index], format: "d"))
                                        .font(.system(size: 14))
                                        .frame(maxWidth: .infinity)
                                        .padding(6)
                                        .background(Color("PrimaryColor"))
                                        .clipShape(Circle())
                                } else {
                                    Text(weekManager.dateToString(date: week.date[index], format: "d"))
                                        .font(.system(size: 14))
                                        .padding(6)
                                        .frame(maxWidth: .infinity)
                                }


                            }
                            .onTapGesture {
                                // Updating Current Day
                                weekManager.tappedDate = week.date[index]
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .background(
                        Rectangle()
                            .fill(.white)
                    )
                }
                .offset(x: myXOffset(week.id), y: 0)
                .padding(.horizontal, 20)
            }
        }
        .frame(maxHeight: .infinity, alignment : .top)
        .padding(.top, 50)
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation {
                        item0Offset = -UIScreen.main.bounds.width + value.translation.width
                        item1Offset = 0.0 + value.translation.width
                        item2Offset = UIScreen.main.bounds.width + value.translation.width
                    }
                }
                .onEnded { value in
                    withAnimation(.linear(duration: animationDuration)) {
                        if value.predictedEndTranslation.width > 0 {
                            dragDirection = .right
                            item0Offset = 0.0
                            item1Offset = UIScreen.main.bounds.width
                            item2Offset = UIScreen.main.bounds.width * 2
                        } else {
                            dragDirection = .left
                            item0Offset = -UIScreen.main.bounds.width * 2
                            item1Offset = -UIScreen.main.bounds.width
                            item2Offset = 0.0
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        // resetting ofssets
                        item0Offset = -UIScreen.main.bounds.width
                        item1Offset = 0.0
                        item2Offset = UIScreen.main.bounds.width
                        weekManager.update(dragDirection: dragDirection)
                        dragDirection = .none
                    }
                }
        )
    }

    func myXOffset(_ item: Int) -> Double {
        if item == 0 {
            return item0Offset
        }
        if item == 1 {
            return item1Offset
        }
        if item == 2 {
            return item2Offset
        }
        return 0
    }
}

struct CalendarWeekView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarWeekView()
    }
}
