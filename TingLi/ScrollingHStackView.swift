//
//  ScrollingHStackModifier.swift
//  CisRestaurant
//
//  Created by Kristanto Sean on 22/05/23.
//

import SwiftUI

struct ScrollingHStackView: View {
    
    var colors: [Color] = [.blue, .green, .red, .orange, .black, .purple]
    @State var selectedColorIndex = 0
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            ForEach(0..<colors.count) { i in
                 colors[i]
                     .frame(width: 250, height: 200, alignment: .center)
                     .cornerRadius(10)
                     .scaleEffect(selectedColorIndex == (colors.count - i - 1) ? 1.1 : 1)
                
            }
        }.modifier(ScrollingHStackModifier(selectedColorIndex: $selectedColorIndex, items: colors.count, itemWidth: 250, itemSpacing: 30))
            .onAppear {
                selectedColorIndex = colors.count - 1
            }
    }
}

struct ScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingHStackView()
    }
}


struct ScrollingHStackModifier: ViewModifier {
    
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    
    @Binding var selectedColorIndex: Int
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    
    init(selectedColorIndex: Binding<Int>, items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
        self._selectedColorIndex = selectedColorIndex
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        
        // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
                
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in
                    dragOffset = event.translation.width
                })
                .onEnded({ event in
                    // Scroll to where user dragged
                    scrollOffset += event.translation.width
                    dragOffset = 0
                    
                    // Now calculate which item to snap to
                    let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
                    let screenWidth = UIScreen.main.bounds.width
                    
                    // Center position of current offset
                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                    
                    // Calculate which item we are closest to using the defined size
                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
                    
                    // Should we stay at current index or are we closer to the next item...
                    if index.remainder(dividingBy: 1) > 0.5 {
                        index += 1
                    } else {
                        index = CGFloat(Int(index))
                    }
                    
                    // Protect from scrolling out of bounds
                    index = min(index, CGFloat(items) - 1)
                    index = max(index, 0)
                    
                    // Set final offset (snapping to item)
                    let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
                    
                    // Animate snapping
                    withAnimation {
                        selectedColorIndex = Int(index)
                        scrollOffset = newOffset
                    }
                    
                })
            )
    }
}
