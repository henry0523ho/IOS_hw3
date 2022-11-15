//
//  gamePage.swift
//  hw3
//
//  Created by henry on 2022/11/15.
//

import SwiftUI

struct gamePage: View {
    @Binding var page:String
    @State var pauseShow:Bool=false
    
    @State var ballDir:Double=0
    var body: some View {
        ZStack{
            VStack{
                Slider(value: $ballDir, in:-100...100)
            }
            
            
            
            
            Button(action: {
                pauseShow=true
            }, label: {
                Image(systemName: "pause").resizable().scaledToFit().frame(width: 30, height: 30, alignment: .center)
                    .padding(.all).background(Color(red: 0.5, green: 0.5, blue: 0.5)).foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)).cornerRadius(10.0).border(Color.white, width: 1)
            }).position(x: 35.0, y: 35.0)
            if pauseShow{
                VStack(alignment: .center, spacing: 0.0){
                    Text("暫停")
                        .font(.largeTitle)
                        .padding(.all)
                    Button(action: {}, label: {
                        pauseMenuBtn(icon:"arrow.clockwise",text:"新遊戲")
                    })
                    .padding(.all)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        pauseMenuBtn(icon: "gearshape.fill", text: "設定")
                    })
                    .padding(.all)
                    Button(action: {
                        page="welcome"
                    }, label: {
                        pauseMenuBtn(icon: "house.fill", text: "回主頁")
                    })
                    .padding(.all)
                    Button(action: {
                        pauseShow=false
                    }, label: {
                        pauseMenuBtn(icon: "xmark.circle", text: "關閉")
                    })
                    .padding(.all)
                }.padding(.all).background(Color.gray)
            }
            
        }
    }
}

struct pauseMenuBtn:View{
    var icon:String
    var text:String
    var body: some View{
        HStack{
            Image(systemName: "\(icon)").resizable().scaledToFit().frame(width: 30, height: 30, alignment: .center)
            Text("\(text)")
                .font(.title)
        }.frame(width: 200, height: 30, alignment: .center)
        .padding(.all).background(Color.blue).foregroundColor(Color.white).cornerRadius(15)
    }
}

struct gamePage_Previews: PreviewProvider {
    @State static var page:String="game"
    static var previews: some View {
        gamePage(page: $page)
    }
}
