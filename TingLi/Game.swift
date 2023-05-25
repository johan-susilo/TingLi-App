//
//  Game.swift
//  Language Learning
//
//  Created by Johan on 17/05/23.
//

import SwiftUI
import AVFoundation

var audioPlay: AVAudioPlayer!

struct Game: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var levelItems: [LevelData]
    
    @State var mapSelected: Bool = false
    @State var teacherSelected: Bool = false
    @State var bookSelected: Bool = false
    @State var show = false
    
    @State var showInfo = true
    
    
  //  @State var firstCorrect = ["teacher", "mapAn"]
    
    var body: some View {
            ZStack {
                
                //            Spacer()
                Image("Game")
                    .edgesIgnoringSafeArea(.top)
                    .onTapGesture { location in
                        print("x: \(location.x), y: \(location.y)")
                        if location.x >= 302 && location.x <= 528 && location.y >= 120 && location.y <= 224 {
                            if mapSelected == false {
                                mapSelected = true
                                //nyalain suara kedua
                                self.playSound(music: "mapAn")
                                self.showInfo = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    self.playSound(music: "teacher")
                                    
                                }
                            }
                        }
                        else if (mapSelected == true && location.x >= 538 && location.x <= 611 && location.y >= 133 && location.y <= 493) {
            
                            if teacherSelected == false {
                                teacherSelected = true
                                //nyalain suara ketiga
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    self.playSound(music: "book")
                                }
                                self.playSound(music: "teacherAn")
                            }
                        }
                        else if (teacherSelected == true && mapSelected == true && location.x >= 448 && location.x <= 492 && location.y >= 420 && location.y <= 438) {
                            if bookSelected == false {
                                bookSelected = true
                                self.playSound(music: "bookAn")
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                levelItems[1].isUnlocked = true
                                levelItems[1].name = "Restaurant"
                                levelItems[1].image = "MCDLogo"
                            }
                        }
                        
                        
                    }
                HStack{
                    Spacer()
                    VStack {
                        Spacer()
                        
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(mapSelected == true ? Color(hex: 0x0081C9) : Color(hex: 0x0081C9).opacity(0.2))
                            .padding([.bottom], 25)
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(teacherSelected == true ? Color(hex: 0x0081C9) : Color(hex: 0x0081C9).opacity(0.2))
                            .padding([.bottom], 25)
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(bookSelected == true ?  Color(hex: 0x0081C9) : Color(hex: 0x0081C9).opacity(0.2))
                            .padding([.bottom], 25)
                        Spacer()
                        Image(systemName: "repeat.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding([.bottom], 10)
                            .foregroundColor(Color(hex: 0x0081C9).opacity(0.5))
                            .onTapGesture {
                                
                                if mapSelected == false {
                                    self.playSound(music: "map")
                                } else if teacherSelected == false {
                                    self.playSound(music: "teacher")
                                    
                                } else if bookSelected == false {
                                    self.playSound(music: "book")}
                            }
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(hex: 0x0081C9).opacity(0.5))
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                        
                        
                    }
                    .padding([.leading, .trailing], 20).background(Color(hex: 0x86E5FF).opacity(1.0))
                }
                
                Circle()
                    .strokeBorder(Color(hex: 0x0081C9).opacity(0.8), lineWidth: 10)
                    .frame(width: 100, height: 100)
                    .position(x: 408, y: 176)
                    .opacity(mapSelected == false ? 0 : 1)
                Circle()
                    .strokeBorder(Color(hex: 0x0081C9).opacity(0.8), lineWidth: 10)
                    .frame(width: 100, height: 100)
                    .position(x: 572, y: 160)
                    .opacity(teacherSelected == false ? 0 : 1)
                Circle()
                    .strokeBorder(Color(hex: 0x0081C9).opacity(0.8), lineWidth: 10)
                    .frame(width: 70, height: 70)
                    .position(x: 470, y: 425)
                    .opacity(bookSelected == false ? 0 : 1)
                
                if showInfo {
                    Text("Listen and tap the object!")
                        .frame(width: 400, height: 50)
                        .background(Color(hex: 0x0081C9).opacity(0.8))
                        .cornerRadius(90)
                        .foregroundColor(.white)
                        .font(Font.custom("Lato-Regular", size: 20))
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
                                showInfo = false
                            }
                        }
                }
                
                
            }
            .navigationBarBackButtonHidden()
            .onAppear {
                //nyalain suara pertama
                self.playSound(music: "map")
                
            }
        
        
    }
    
    
    func playSound(music: String) {
        let url = Bundle.main.url(forResource: music, withExtension: "mp3")
        guard url != nil else {
            return
        }
        do {
            audioPlay = try AVAudioPlayer(contentsOf: url!)
            audioPlay?.play()
        } catch {
            print("error")
        }
    }
    
    struct Game_Previews: PreviewProvider {
        static var previews: some View {
            Game(levelItems: .constant([])).previewInterfaceOrientation(.landscapeRight)
            
        }
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

