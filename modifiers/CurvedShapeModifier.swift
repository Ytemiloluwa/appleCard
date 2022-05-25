//
//  CurvedShapeModifier.swift
//  appleCard
//
//  Created by Temiloluwa on 17/10/2020.
//

import SwiftUI

struct CurvedShapeModifier: ViewModifier {
    var shouldClip = false
    func body(content: Content) -> some View {
        
        if shouldClip {
            return AnyView(content.clipShape(CurvedShape()))
        } else {
            return AnyView(content)
        }
    }
}

extension View {
    func clip(shouldCurve: Bool) -> some View {
        self.modifier(CurvedShapeModifier(shouldClip: shouldCurve) )
    }
}
