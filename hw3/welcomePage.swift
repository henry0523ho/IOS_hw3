//
//  welcomePage.swift
//  hw3
//
//  Created by henry on 2022/11/15.
//

import SwiftUI

struct welcomePage: View {
    @Binding var page:String
    var body: some View {
        VStack{
            Text("中國文化")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.all)
            Button(action: {
                page="date"
            }, label: {
                Text("中國時間系統")
                    .padding(.all).background(Color(red: 0.3, green: 0.3, blue: 0.5))
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 1.0))
            })
            Button(action: {
                page="game"
            }, label: {
                Text("小遊戲")
                    .padding(.all).background(Color(red: 0.3, green: 0.3, blue: 0.5))
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 1.0))
            })
            Button(action: {
                page="name"
            }, label: {
                Text("姓名算命")
                    .padding(.all).background(Color(red: 0.3, green: 0.3, blue: 0.5))
                    .foregroundColor(Color(red: 0.9, green: 0.9, blue: 1.0))
            })
        }
    }
}

struct welcomePage_Previews: PreviewProvider {
    @State static var page:String="welcome"
    static var previews: some View {
        welcomePage(page: $page)
    }
}
