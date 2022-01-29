//
//  CourseDetailView.swift
//  CoreDataTest
//
//  Created by John DaCorte on 1/26/22.
//

import SwiftUI

struct CourseDetailView: View {
    let course: Course
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteCourseAlert = false
    @State private var showingEditCourseView = false
    
    var body: some View {
//        NavigationView {
            
            ScrollView {
                VStack {
                    Text(course.name ?? "Unknown Course")
                        .font(.title)
                        .foregroundColor(.secondary)
                    Text("Par \(course.par)")
                    Text("Rating \(course.rating, specifier: "%.1f")")
                    Text("Slope \(course.slope, specifier: "%.1f")")
                    Spacer()
                    Button ("edit course"){
                        self.showingEditCourseView = true
                    } .sheet(isPresented: $showingEditCourseView,
                             content: {
                        EditCourseView(course: course)
                    })
                    
                    
                }
            }
            .navigationTitle(course.name ?? "Unknown Course")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Delete Course?", isPresented: $showingDeleteCourseAlert) {
                Button("Delete", role: .destructive, action: deleteCourse)
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure?")
            }
            .toolbar {
                Button {
                    showingDeleteCourseAlert = true
                } label: {
                    Label("Delete this course", systemImage: "trash")
                }
            }
            
//        }
    }
    
    func deleteCourse() {
        moc.delete(course)
        try? moc.save()
        dismiss()
    }
}

