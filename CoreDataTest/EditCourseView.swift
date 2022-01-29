//
//  EditCourseView.swift
//  CoreDataTest
//
//  Created by John DaCorte on 1/27/22.
//

import SwiftUI

struct EditCourseView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    let course: Course
    
    @State private var name = ""
    @State private var par: Int16 = 72
    @State private var rating: Double = 70.0
    @State private var slope: Double = 120.0
    
    var body: some View {
        NavigationView {
            Form {
                Section("Course Name") {
                    TextField(course.name ?? "Unknown Course", text: $name)
                }
                Section("Par") {
                    TextField("Par", value: $par, format: .number)
                }
                Section("Rating") {
                    TextField("Rating", value: $rating, format: .number)
                }
                Section("Slope") {
                    TextField("Slope", value: $slope, format: .number)
                }
                Section {
                    Button("Save") {
                        
                        course.name = name
                        course.par = par
                        course.rating = rating
                        course.slope = slope
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct EditCourseView_Previews: PreviewProvider {
    static var previews: some View {
        EditCourseView(course: Course())
    }
}
