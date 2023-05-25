////
////  Levels.swift
////  Language Learning
////
////  Created by Johan on 17/05/23.
////
//
//import SwiftUI
//
//struct LibraryData : Hashable {
//    var name: String
//    var image: String
//    var isUnlocked: Bool
//}
//
//
//struct Library: View {
//    //    let items = 1...10
//    
//    @State var levelItems = [
//        LevelData(name: "Level 1", image: "Classroom", isUnlocked: true),
//        LevelData(name: "Level 2", image: "lock", isUnlocked: false),
//        LevelData(name: "Level 3", image: "lock", isUnlocked: false),
//        LevelData(name: "Level 4", image: "lock", isUnlocked: false),
//        LevelData(name: "Level 5", image: "lock", isUnlocked: false),
//    ]
//    
//    let rows = [
//        GridItem(.fixed(50))
//    ]
//    
//    @State var selectedItemIndex = 0
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView(.horizontal) {
//                LazyHGrid(rows: rows, alignment: .center) {
//                    HStack(alignment: .center, spacing: 30) {
//                        ForEach(0..<levelItems.count, id: \.self) { i in
//                            if levelItems[i].isUnlocked == true {
//                                
//                                //NavigationLink(destination: Library1(levelItems: $levelItems), label: {
//                                    VStack{
//                                        Image(levelItems[i].image)
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 60, height: 60)
//                                            .padding(40)
//                                            .background(.blue.opacity(0.2))
//                                            .cornerRadius(10)
//                                        Text(levelItems[i].name).font(Font.custom("Lato-Regular", size: 15))
//                                    }
//                                    .padding(20)
//                                        .frame(width: 200, height: 200)
//                                        .scaleEffect(selectedItemIndex == (levelItems.count - i - 1) ? 1.3 : 1)
//                                        .opacity(selectedItemIndex == (levelItems.count - i - 1) ? 1.5 : 0.3)
//                                //})
//                                
//                            } else {
//                                VStack{
//                                    Image(levelItems[i].image)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 60, height: 60)
//                                        .padding(40)
//                                        .background(.blue.opacity(0.2))
//                                        .cornerRadius(10)
//                                    Text(levelItems[i].name).font(Font.custom("Lato-Regular", size: 15))
//                                } .padding(20)
//                                    .frame(width: 200, height: 200)
//                                    .scaleEffect(selectedItemIndex == (levelItems.count - i - 1) ? 1.5 : 1)
//                                    .opacity(levelItems[i].isUnlocked ? 1 : 0.5)
//                                
//                            }
//                        }
//                        
//                    }
//                }
//            }
//           // .modifier(LibraryScroller(selectedItemIndex: $selectedItemIndex, items: levelItems.count, itemWidth: 250, itemSpacing: 30))
//            // .padding(.bottom, 20)
//        }
//        
//    }
//    
//}
//
//struct LibraryScroller: ViewModifier {
//    
//    @State private var scrollOffset: CGFloat
//    @State private var dragOffset: CGFloat
//    
//    @Binding var selectedItemIndex: Int
//    var items: Int
//    var itemWidth: CGFloat
//    var itemSpacing: CGFloat
//    
//    init(selectedItemIndex: Binding<Int>, items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
//        self._selectedItemIndex = selectedItemIndex
//        self.items = items
//        self.itemWidth = itemWidth
//        self.itemSpacing = itemSpacing
//        
//        // Calculate Total Content Width
//        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
//        let screenWidth = UIScreen.main.bounds.width
//        
//        // Set Initial Offset to first Item
//        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
//        
//        self._scrollOffset = State(initialValue: initialOffset)
//        self._dragOffset = State(initialValue: 0)
//    }
//    
//    func body(content: Content) -> some View {
//        content
//            .offset(x: scrollOffset + dragOffset, y: 0)
//            .gesture(DragGesture()
//                .onChanged({ event in
//                    dragOffset = event.translation.width
//                })
//                    .onEnded({ event in
//                        // Scroll to where user dragged
//                        scrollOffset += event.translation.width
//                        dragOffset = 0
//                        
//                        // Now calculate which item to snap to
//                        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
//                        let screenWidth = UIScreen.main.bounds.width
//                        
//                        // Center position of current offset
//                        let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
//                        
//                        // Calculate which item we are closest to using the defined size
//                        var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
//                        
//                        // Should we stay at current index or are we closer to the next item...
//                        if index.remainder(dividingBy: 1) > 0.5 {
//                            index += 1
//                        } else {
//                            index = CGFloat(Int(index))
//                        }
//                        
//                        // Protect from scrolling out of bounds
//                        index = min(index, CGFloat(items) - 1)
//                        index = max(index, 0)
//                        
//                        // Set final offset (snapping to item)
//                        let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
//                        
//                        // Animate snapping
//                        withAnimation {
//                            selectedItemIndex = Int(index)
//                            scrollOffset = newOffset
//                        }
//                        
//                    })
//            )
//    }
//}
//
//
//struct Library_Previews: PreviewProvider {
//    static var previews: some View {
//        Library()
//    }
//}
