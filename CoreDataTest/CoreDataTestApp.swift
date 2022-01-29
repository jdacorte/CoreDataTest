//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by John DaCorte on 1/25/22.
//

import SwiftUI

@main
struct CoreDataTest: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
