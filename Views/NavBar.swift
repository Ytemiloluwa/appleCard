//
//  NavBar.swift
//  appleCard
//
//  Created by Temiloluwa on 17/10/2020.
//

import SwiftUI

struct NavBar: View {
    
    
    @Binding var showMenu: Bool
    var title: String = "Apple Card"
    var showSearchField = true
    
    @State private var searchTerm = ""
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack {

                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
            }
            
        }.padding(.bottom, 10)
            .frame(maxWidth: .infinity)
            .frame(height: showSearchField ? 140 : 90,alignment: showSearchField ? .center : .bottom)
            .background(LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
            .clip(shouldCurve: showSearchField)
        
    }
}
struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(showMenu: .constant(false)).previewLayout(.sizeThatFits)
    }
}
