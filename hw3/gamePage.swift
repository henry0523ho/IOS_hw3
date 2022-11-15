//
//  gamePage.swift
//  hw3
//
//  Created by henry on 2022/11/15.
//

import SwiftUI

extension AnyTransition{
    static var atkAnimation: AnyTransition{
        let shift=AnyTransition.offset(x: 0, y: 350)
        return AnyTransition.asymmetric(insertion: shift.combined(with: .opacity), removal: .opacity)
    }
}

struct gamePage: View {
    @Binding var page:String
    @State var pauseShow:Bool=false
    @State var atkColor:Color=Color.red
    @State var enemyPick:Int=1
    @State var atkState:Int=0
    @State var showSheet=true
    
    @State var dist:CGFloat = -350
    
    @State var atkSize:CGFloat=100
    
    
    var enemys=["Xi","Winnie","Virus"]
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack{
                Image("\(enemys[enemyPick])").resizable().scaledToFit().frame(width: geometry.size.width/2, alignment: .center).position(x:geometry.size.width/2,y:150)
                
                Button(action: {
                    if atkState==0{
                        atkState=1
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.7){
                            atkState=0
                        }
                    }
                }, label: {
                    Image("dragon").resizable().scaledToFit().frame(width: geometry.size.width/2, alignment: .center)
                }).position(x:geometry.size.width/2, y:500)
                VStack{
                    Spacer().frame(height:650)
                    Form{
                        DisclosureGroup("設定選項"){
                            //Form{
                            ColorPicker("攻擊顏色",selection: $atkColor, supportsOpacity: false)
                            Text("攻擊對象")
                            Picker(selection: $enemyPick, label: Text("選擇敵人"), content: {
                                Text("\(enemys[0])").tag(0)
                                Text("\(enemys[1])").tag(1)
                                Text("\(enemys[2])").tag(2)
                            }).pickerStyle(SegmentedPickerStyle())
                            Text("攻擊大小")
                            Slider(value: $atkSize, in: 50...200)
                        }
                    }
                        
                    
                }.frame(width: geometry.size.width,height: geometry.size.height, alignment: .bottom)
                
                VStack{
                    if atkState==1{
                        Image(systemName: "hurricane").resizable().scaledToFit().frame(width: atkSize, height: atkSize, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(atkColor).position(x: geometry.size.width/2, y:150).transition(.atkAnimation)
                    }
                }.animation(.easeIn(duration: 0.5))
                
                
                Button(action: {
                    page="welcome"
                }, label: {
                    Image(systemName: "arrow.left").resizable().scaledToFit().frame(width: 30, height: 30, alignment: .center)
                        .padding(.all).background(Color(red: 0.5, green: 0.5, blue: 0.5)).foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)).cornerRadius(10.0).border(Color.white, width: 1)
                }).position(x: 35.0, y: 35.0)
            }
            
        })
        
    }
    
}



struct gamePage_Previews: PreviewProvider {
    @State static var page:String="game"
    static var previews: some View {
        gamePage(page: $page)
    }
}
