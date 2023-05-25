//
//  Page1.swift
//  Language Learning
//
//  Created by Johan on 17/05/23.
//

import SwiftUI

struct Page1: View {
    var body: some View {
        VStack{
            Image("Game")
                .edgesIgnoringSafeArea(.top)
                .onTapGesture { location in
                    print("x: \(location.x), y: \(location.y)")
                }
        }
    }
    
    struct Page1_Previews: PreviewProvider {
        static var previews: some View {
            Page1()
        }
    }
}
