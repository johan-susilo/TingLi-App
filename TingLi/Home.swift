//
//  Home Screen.swift
//  Language Learning
//
//  Created by Johan on 17/05/23.
//

import SwiftUI

struct Home: View {
    
    
    var menu = ["Levels", "Tutorial"]
    @State private var selectedItem = "Levels"
    
    var body: some View {
        NavigationStack {
            VStack{
                Picker("", selection: $selectedItem) {
                    ForEach(menu, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented).padding(50).padding([.trailing, .leading], 200)
                if(selectedItem == "Levels"){
                    Levels()
                    //                    .padding(.leading, 17)
                    //                    .padding(.leading, 17)
                } else {
                
                        Tutorial()
                        //                    .padding(.leading, 17)
                    
                }
                
                Spacer()
            }
            
        }
    }
}

import SwiftUI

//struct Resto: View {
//    
//    
//    var colors = ["Red", "Green", "Blue", "Tartan"]
//    @State private var selectedColor = "Green"
//    
//    
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                Picker("Please choose a color", selection: $selectedColor) {
//                    ForEach(colors, id: \.self) {
//                        Text($0)
//                    }
//                }
//                .pickerStyle(.segmented)
//                
//                
//                if(selectedColor == "Red"){
//                    NavigationLink(destination: Page1()){
//                        Item(title: "A&W",subTitle: "Fried Chicken",image: "AWLogo")
//                        //                    .padding(.leading, 17)
//                    }
//                }
//                
//                Item(title: "Burger",subTitle: "BURGER",image: "BKBaconCheeseburger")
//                Item(title: "Apple",subTitle: "BURGER",image: "BKBaconCheeseburger")
//                
//                
//                Text(selectedColor)
//                
//            }
//            .navigationTitle("Food")
//        }
//        
//    }
//}
//
//struct Resto_Previews: PreviewProvider {
//    static var previews: some View {
//        Resto()
//    }
//}
//


struct Home_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Home().previewInterfaceOrientation(.landscapeRight)
    }
}
