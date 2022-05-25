//
//  ContentView.swift
//  Shared
//
//  Created by Temiloluwa on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
    
        VStack {
            
            ScrollView(.horizontal) {
                
                LazyHStack {
                    
                    ForEach(1...10000, id: \.self) { item in
                        
                        ListRow(id: item, type: "Horizontal")
                    }
                }
                
            }.frame(height: 100, alignment: .center)
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(1...10000, id: \.self) { item in
                        
                        ListRow(id: item, type: "Vertical")
                    }
                }
            }

        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    
struct ListRow: View {
    
    let id: Int
    let type: String
    
    init(id: Int, type: String) {
        
       // print("Loading\(type)item \(id)")
        
        self.id = id
        self.type = type
    }
    
    var body: some View {
        
       // Text("Loading\(type)item \(id)")
        Text("Horizontal")
            .padding()
    }
}
