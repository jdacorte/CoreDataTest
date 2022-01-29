//
//  AddHoleSpecView.swift
//  CoreDataTest
//
//  Created by John DaCorte on 1/28/22.
//

import SwiftUI

struct AddHoleSpecView: View {
    let holeNum: Int
    
    @State private var par: Int16 = 4
    @State private var yards: Int16 = 350
    @State private var HCP: Int16 = 1
    
    var body: some View {
        Text("Hole \(holeNum)")
      
           
                HStack {
                
                        TextField("Par", value: $par, format: .number)
                    
                        TextField("Yards", value: $yards, format: .number)
                    
                        TextField("Handicap", value: $HCP, format: .number)
                
                }
        
            
        
    }
}

//struct AddHoleSpecView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddHoleSpecView(
//    }
//}
