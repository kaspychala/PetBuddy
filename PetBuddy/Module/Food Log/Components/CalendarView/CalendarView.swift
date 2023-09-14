//
//  CalendarView.swift
//  PetBuddy-iOS
//
//  Created by Kasper Spychala on 03/05/2023.
//

import SwiftUI

struct CalendarView: View {
	var body: some View {
		VStack {
			CalendarWeekView()
		}
	}
}

struct CalendarView_Previews: PreviewProvider {
	static var previews: some View {
		CalendarView()
	}
}
