//
//  namePage.swift
//  hw3
//
//  Created by User11 on 2022/11/15.
//

import SwiftUI

struct namePage: View {
    @Binding var page:String
    @State var name:String=""
    
    var result=["大凶","凶","平","吉","大吉"]
    
    var body: some View {
        ZStack{
            VStack{
                Text("姓名算命")
                    .font(.largeTitle)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Form{
                    TextField("輸入你的名字", text: $name)
                    if name != ""{
                        Text("\(name)的算命結果為\(result[ (Int(name.hash)<0 ? Int(name.hash) * -1 : Int(name.hash)) % 5])")
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
