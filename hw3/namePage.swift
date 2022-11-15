//
//  namePage.swift
//  hw3
//
//  Created by User11 on 2022/11/15.
//

import SwiftUI

struct namePage: View {
    @Binding var page:String
    @State var lastname:String=""
    @State var name:String=""
    var result=["大凶","凶","平","吉","大吉"]
    
    @State var lnameResult:Int = -1
    @State var nameResult:Int = -1
    var body: some View {
        ZStack{
            VStack{
                Text("姓名算命")
                    .font(.largeTitle)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Form{
                    TextField("輸入你的姓氏", text: $lastname)
                    TextField("輸入你的名字", text: $name)
                    Button(action: {
                        lnameResult=(Int(name.hash)<0 ? Int(name.hash) * -1 : Int(name.hash)) % 5
                        nameResult=Int.random(in: 0...4)
                    }, label: {
                        Text("開始算命")
                    })
                    if lnameResult != -1 && nameResult != -1{
                        Text("姓氏'\(lastname)'的算命結果為\n\(result[lnameResult]) ")
                        Text("名字'\(name)'的算命結果為\n\(result[nameResult])")
                    }
                    
                }
                
            }
            
        }
    }
}

struct namePage_Previews: PreviewProvider {
    @State static var page:String="name"
    static var previews: some View {
        namePage(page:$page)
    }
}
