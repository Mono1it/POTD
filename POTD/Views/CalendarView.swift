import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    
    @Binding var selectedDate: Date
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        
        calendar.scope = .month
        calendar.scrollDirection = .horizontal
        
        calendar.appearance.todayColor = .systemBlue
        calendar.appearance.selectionColor = .systemBlue
        
        calendar.appearance.headerTitleFont = .boldSystemFont(ofSize: 20)
        calendar.appearance.weekdayFont = .systemFont(ofSize: 14)
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension CalendarView {

    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {

        var parent: CalendarView

        init(_ parent: CalendarView) {
            self.parent = parent
        }

        func calendar(_ calendar: FSCalendar,
                      didSelect date: Date,
                      at monthPosition: FSCalendarMonthPosition) {

            parent.selectedDate = date
        }
    }

}
