//
//  ContentView.swift
//  CoreDataTest
//
//  Created by John DaCorte on 1/25/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name),
    ]) var courses: FetchedResults<Course>
    
    @State private var showingCourseAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(courses) { course in
                    NavigationLink {
                        // this is where the navLink will go
                        CourseDetailView(course: course)
                    } label: {
                        // this is what the navLink looks like
                        
                        VStack(alignment: .leading) {
                            Text(course.name ?? "Unknown Course" )
                                .font(.headline)
                            Text("Par: \(course.par)")
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }
                .onDelete(perform: deleteCourse)
            }
            .navigationTitle("Courses")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingCourseAddScreen.toggle()
                    } label: {
                        Label("Add Course", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingCourseAddScreen) {
                AddCourseView()
            }
        }
        
    }
    
    func deleteCourse(at offsets: IndexSet) {
        for offset in offsets {
            let course = courses[offset]
            moc.delete(course)
            try? moc.save
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
