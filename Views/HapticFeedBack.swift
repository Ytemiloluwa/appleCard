//
//  HapticFeedBack.swift
//  appleCard
//
//  Created by Temiloluwa on 17/10/2020.
//

import SwiftUI

struct HapticFeedback {
    public static func generate(){
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }
}
