//
//  ContentView.swift
//  Shared
//
//  Created by Temiloluwa on 14/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu = false
    @State var selectedSegment: Segment?
    
    var body: some View {
        
        let body = GeometryReader { geometry in
            
            self.createBody(size: geometry.size).edgesIgnoringSafeArea(.top)
        }

        let leadingBarItem = Button(action: {}) {
            Text("")
        }

        return NavigationView {

            body.navigationBarItems(leading: leadingBarItem)
            

        }.colorScheme(.light)
    }
    
    private func createBody(size: CGSize) -> some View {
        let circleRadius = size.height / 2.0
        
        let buttonWidth = (size.width - 3.0 * 16.0) / 2.0
        
        return ZStack {
            
          
           // Color.background.edgesIgnoringSafeArea(.vertical)
            VStack(alignment: .center) {
                NavBar(showMenu: $showMenu).edgesIgnoringSafeArea(.top)
                self.createTitle()
                self.createCircleControl(radius: circleRadius)
                self.createDescription()
               // self.createButtons(width: buttonWidth)
            }.padding(.top, 32.0)
        }
    }
    private func createTitle() -> some View {

        return Group {

            Text("Choose Amount")
               
                .font(.system(.largeTitle))
                .fontWeight(.heavy)
                .gradientForeground(colors: [Color.pink, Color.purple])
            
         //   Text("make Payment by March 31")
        }
    }

    func createDescription() -> some View {
        
        return Group {
            
            Text(selectedSegment?.title ?? "")
                .font(.system(.headline))
                .fontWeight(.semibold)
            
            Group {
                
                Text(selectedSegment?.description ?? "")
                    .font(.system(.subheadline))
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray.opacity(0.9))
                    +
                    Text(" Learn More...")
                    .font(.system(.subheadline))
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)
                
            }.multilineTextAlignment(.center)
            .lineLimit(3)
            
        }
    }
    
    private func createButtons(width: CGFloat) -> some View {
        
        return Group {
            
              EmptyView()

        }
    }
    
    private func createCircleControl(radius: CGFloat) -> some View {
        
        let totalBalance: Double = 1682.55
            //Double.random(in: 0...60)
        let segment: [Segment]  = [
            Segment(
                color: Color.red.opacity(0.8),
                amount: 175.0,
                title: "Reduce Interest Charges",
                description: "Paying more than the minimum amount each\nmonth will help you reduce or even avoid\ninterest charges."),
            Segment(
                color: Color.pink.opacity(0.8),
                amount: 672.37,
                title: "Start a 3-Month Payment Plan",
                description: "Pay the suggested amount every month and\nyour balance could be paid off in just three\nmonths."),
            Segment(
                color: Color.purple.opacity(0.8),
                amount: 1180.78,
                title: "Pay February Balance",
                description: "Paying your monthly statement balance helps\nkeep you financially healthy and avoid interest\ncharges.")
        ]
        
        let circleControl = CircleControl(totalBalance: totalBalance, segments: segment, selectedSegment: $selectedSegment)
        
        return circleControl
            .frame(width: radius, height: radius)
            .padding(16.0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct GradientText: View {

    var body : some View {

        Text("gradient")
            .gradientForeground(colors: [Color.pink, Color.purple])
            .padding(.horizontal, 20)
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(10)
            .font(.title)

    }
}

extension View {

    public func gradientForeground(colors: [Color])-> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors), startPoint: .top, endPoint: .bottomLeading))
            .mask(self)

    }
}
