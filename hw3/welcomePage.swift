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
            Text("保齡球")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Button(action: {
                page="game"
            }, label: {
                Text("開始遊戲")
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).background(Color(red: 0.3, green: 0.3, blue: 0.5))
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
