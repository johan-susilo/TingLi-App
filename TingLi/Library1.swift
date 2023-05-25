import SwiftUI
import AVFoundation

var AudioPlay: AVAudioPlayer!

struct Library1: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var studentSelected: Bool = false
    @State private var mapSelected: Bool = false
    @State private var bookSelected: Bool = false
    @State private var teacherSelected: Bool = false
    @State private var tableSelected: Bool = false
    
    
    var body: some View {
        ZStack {
            Image("Game")
                .onTapGesture { location in
                    print("location:\(location.x), \(location.y)")
                    //cek murid angkat tangan
                    if (location.x >= 360 && location.x <= 440 && location.y >=  285 && location.y <= 400) {
                        studentSelected = true
                        self.playSound(music: "studentL")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            studentSelected = false
                        }
                        
                    }
                    //cek peta
                    else if (location.x >= 300 && location.x <= 540 && location.y >= 136 && location.y <= 200) {
                        mapSelected = true
                        self.playSound(music: "mapL")
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            mapSelected = false
                        }
                        
                    }
                    //cek guru
                    else if (location.x >= 550 && location.x <= 600 && location.y >= 100 && location.y <= 400) {
                        teacherSelected = true
                        self.playSound(music: "teacherL")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            teacherSelected = false
                        }
                        
                    }
                    
                    //cek buku murid berkacamata
                    else if (location.x >= 800 && location.x <= 840 && location.y >= 400 && location.y <= 440) {
                        bookSelected = true
                        self.playSound(music: "bookL")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            bookSelected = false
                        }
                        
                    }  else if (location.x >= 202 && location.x <= 268 && location.y >= 331 && location.y <= 371) {
                        tableSelected = true
                        self.playSound(music: "tableL")
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            tableSelected = false
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
                        .foregroundColor(Color(hex: 0x0081C9).opacity(0))
                        .padding([.bottom], 25)
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: 0x0081C9).opacity(0))
                        .padding([.bottom], 25)
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: 0x0081C9).opacity(0))
                        .padding([.bottom], 25)
                    Spacer()
                    Image(systemName: "repeat.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding([.bottom], 10)
                        .foregroundColor(Color(hex: 0x0081C9).opacity(0))
                    
                    
                    Image(systemName: "house.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: 0x0081C9).opacity(0.5))
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }.padding([.leading, .trailing], 20).background(Color(hex: 0x86E5FF).opacity(1.0))
            }
            
            Group{
            Color.white
                .frame(width: 120, height: 100)
                .cornerRadius(20)
                .opacity(mapSelected == false ? 0 : 0.8)
                .position(x: 420, y: 160)
            Text("地图")
                .position(x: 420, y: 140)
                .font(.largeTitle)
                .opacity(mapSelected == false ? 0 : 1)
            Text("Dìtú")
                .position(x: 420, y: 180)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .opacity(mapSelected == false ? 0 : 1)
            
            Color.white
                .frame(width: 200, height: 100)
                .cornerRadius(20)
                .opacity(studentSelected == false ? 0 : 0.8)
                .position(x: 404, y: 420)
            Text("学生")
                .position(x: 404, y: 400)
                .font(.largeTitle)
                .opacity(studentSelected == false ? 0 : 1)
            Text("Xuéshēng")
                .position(x: 404, y: 440)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .opacity(studentSelected == false ? 0 : 1)
            
            Group{
            Color.white
                .frame(width: 150, height: 100)
                .cornerRadius(20)
                .opacity(teacherSelected == false ? 0 : 0.8)
                .position(x: 568, y: 258)
            Text("老师")
                    .position(x: 568, y: 240)
                    .font(.largeTitle)
                    .opacity(teacherSelected == false ? 0 : 1)
                Text("Lǎoshī")
                    .position(x: 568, y: 280)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .opacity(teacherSelected == false ? 0 : 1)
                
                Color.white
                    .frame(width: 150, height: 100)
                    .cornerRadius(20)
                    .opacity(tableSelected == false ? 0 : 0.8)
                    .position(x: 200, y: 258)
                Text("桌子")
                        .position(x: 200, y: 240)
                        .font(.largeTitle)
                        .opacity(tableSelected == false ? 0 : 1)
                Text("Zhuōzi")
                    .position(x: 200, y: 280)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .opacity(tableSelected == false ? 0 : 1)
            }
                
                Color.white
                    .frame(width: 115, height: 95)
                    .cornerRadius(20)
                    .opacity(bookSelected == false ? 0 : 0.8)
                    .position(x: 740, y: 430)
                Text("书")
                    .position(x: 740, y: 410)
                    .font(.largeTitle)
                    .opacity(bookSelected == false ? 0 : 1)
                Text("Shū")
                    .position(x: 740, y: 450)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .opacity(bookSelected == false ? 0 : 1)
            }
        
            
        }.navigationBarBackButtonHidden()
        
//        .onAppear {
//            self.playSound(music: "question1student")
//        }
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
}


//struct Library1: View {
//    var body: some View {
//        ZStack {
//            Image("level 1")
//            Color.white
//                .frame(width: 100, height: 100)
//                .cornerRadius(20)
//                .opacity(0.8)
//                .position(x: 420, y: 160)
//            Text("地图")
//                .position(x: 420, y: 140)
//                .font(.largeTitle)
//            Text("Dìtú")
//                .position(x: 420, y: 180)
//                .font(.largeTitle)
//                .foregroundColor(.blue)
//            Color.white
//                .frame(width: 130, height: 100)
//                .cornerRadius(20)
//                .opacity(0.8)
//                .position(x: 568, y: 258)
//            Text("老师")
//                .position(x: 568, y: 240)
//                .font(.largeTitle)
//            Text("Lǎoshī")
//                .position(x: 568, y: 280)
//                .font(.largeTitle)
//                .foregroundColor(.blue)
//            Color.white
//                .frame(width: 180, height: 100)
//                .cornerRadius(20)
//                .opacity(0.8)
//                .position(x: 404, y: 420)
//            Text("学生")
//                .position(x: 404, y: 400)
//                .font(.largeTitle)
//            Text("Xuéshēng")
//                .position(x: 404, y: 440)
//                .font(.largeTitle)
//                .foregroundColor(.blue)
//        }
//
//    }
//}

struct Library1_Previews: PreviewProvider {
    static var previews: some View {
        Library1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
