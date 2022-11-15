//
//  ContentView.swift
//  hw3
//
//  Created by henry on 2022/10/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var page:String = "welcome"
    var body: some View {
        if page=="welcome"{
            welcomePage(page: $page)
        }else if page=="game"{
            gamePage(page: $page)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
