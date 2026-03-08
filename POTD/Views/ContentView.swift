import SwiftUI

struct ContentView: View {
    
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                CalendarView(selectedDate: $selectedDate)
                    .frame(height: 350)
                
                Text("Selected date:")
                    .font(.headline)
                
                Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.title)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
