//
//  ContentView.swift
//  Language Learning
//
//  Created by Johan on 16/05/23.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!


struct Info{
    let han: String
    let pin: String
    let sound: String
}


struct ContentView: View {
    @State var show = false
    
    
    
    var firstPage = [Info]()
    //deklarasi variable untuk menampung data yang dipilih
    @State var selectedPage: Info = Info(han: "", pin: "", sound: "")
    
    
    //let names = ["我们开始吧！", "好久不见", "很开心你来这里", "你好"]
    //(han:"我们开始吧！", pin: "ok"), (han: "好久不见", pin:"not bad")
    //let randomName: String
    
    init() {
        firstPage.append(Info(han: "好久不见", pin: "Hǎojiǔ bùjiàn", sound:"haojiu"))
        firstPage.append(Info(han: "我们开始吧！", pin: "Wǒmen kāishǐ ba!", sound: "women"))
        firstPage.append(Info(han: "很开心你来这里", pin: "Hěn kāixīn nǐ lái zhèlǐ", sound: "henkaixin"))
        firstPage.append(Info(han: "你好!", pin: "Nǐ hǎo!", sound: "nihao"))
        
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text(selectedPage.han)
                    .font(Font.custom("MaShanZheng-Regular", size: 50))
                    .foregroundColor(Color(hex: 0x0081C9))
                
                Text(selectedPage.pin)
                    .foregroundColor(Color(hex: 0x5BC0F8))
                    .font(Font.custom("Lato-Regular", size: 25))
                Spacer()
            }
            .padding()
//            NavigationLink(destination: , isActive: $show, label: {
//
//            }) .onAppear {
//
//
//            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.show.toggle()
            }
            
            //random angka untuk milih data yang ditampilkan
            let randomInt = Int.random(in: 0..<firstPage.count)
            selectedPage = firstPage[randomInt]
            self.playSound(music: selectedPage.sound)
        }
        .sheet(isPresented: $show) {
            Home()
        }
    }
    
    
    func playSound(music: String) {
        let url = Bundle.main.url(forResource: music, withExtension: "mp3")
       
        
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer (contentsOf: url!)
            player?.play()
        } catch {
            print("error")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
