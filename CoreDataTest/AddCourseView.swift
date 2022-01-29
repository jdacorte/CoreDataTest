//
//  AddCourseView.swift
//  CoreDataTest
//
//  Created by John DaCorte on 1/26/22.
//

import SwiftUI

struct AddCourseView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var par: Int16?
    @State private var rating: Double?
    @State private var slope: Double?
    
    var body: some View {
        NavigationView {
            Form {
                Section("Course Information") {
                    TextField("Name of course", text: $name)
                    TextField("Par", value: $par, format: .number)
                    TextField("Rating", value: $rating, format: .number)
                    TextField("Slope", value: $slope, format: .number)
                }
                
                Section("Hole Information") {
                    ForEach (1...18, id: \.self) {
                        AddHoleSpecView(holeNum: $0)
                    }
                }
                
                //                Section {
                //                    Button("Save") {
                //                        let newCourse = Course(context: moc)
                //                        newCourse.id = UUID()
                //                        newCourse.name = name
                //                        newCourse.par = par ?? 72
                //                        newCourse.rating = rating ?? 72
                //                        newCourse.slope = slope ?? 120
                //
                //
                //                        try? moc.save()
                //                        dismiss()
                //                    }
                //                }
                .navigationTitle("Add course")
                .toolbar {
                    
                    Button {
                        let newCourse = Course(context: moc)
                        newCourse.id = UUID()
                        newCourse.name = name
                        newCourse.par = par ?? 72
                        newCourse.rating = rating ?? 72
                        newCourse.slope = slope ?? 120
                        
                        
                        try? moc.save()
                        dismiss()
                    } label: {
                        Label("Save", systemImage: "square.and.arrow.down.fill")
                    }
                }
            }
        }
    }
}


//struct AddCourseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCourseView()
//    }
//}
