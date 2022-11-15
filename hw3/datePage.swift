//
//  datePage.swift
//  hw3
//
//  Created by User11 on 2022/11/15.
//

import SwiftUI

struct datePage: View {
    var skyText=["庚","辛","任","葵","甲","乙","丙","丁","戊","己"]
    var grondText=["申","酉","戌","亥","子","丑","演","卯","辰","巳","午","未"]
    var timeText=["子","丑","演","卯","辰","巳","午","未","申","酉","戌","亥"]
    @Binding var page:String
    
    @State var searchTime=Date()
    @State var showAlert=false
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack{
                VStack(alignment: .center){
                    Text("中國時間系統")
                        .font(.largeTitle)
                        .padding(.all)
                    DatePicker(selection: $searchTime, label: {
                        Text("輸入日期和時間：")
                    })
                    .padding(.all)
                    Button(action: {
                        showAlert=true
                    }, label: {
                        Text("查詢").font(.title).foregroundColor(Color.white).padding(.all).background(Color.blue).cornerRadius(10)
                    }).alert(isPresented: $showAlert, content: {
                        let calendar=Calendar.current
    //                    let year=calendar.component(.year, from: searchTime)
                        let hour=calendar.component(.hour, from: searchTime)
    //                    let sky=year%10
    //                    let ground=year%12
                        let t=((hour+1)/2)
                        return Alert(title: Text("\(originDate(time: searchTime))\n為\n\(lunarDate(time: searchTime))\(timeText[t])時"))
                    })
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                
                
                Button(action: {
                    page="welcome"
                }, label: {
                    Image(systemName: "arrow.left").resizable().scaledToFit().frame(width: 30, height: 30, alignment: .center)
                        .padding(.all).background(Color(red: 0.5, green: 0.5, blue: 0.5)).foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)).cornerRadius(10.0).border(Color.white, width: 1)
                }).position(x: 35.0, y: 35.0)
            }
            
        })
    }
    func originDate(time:Date)->String{
        let formatter=DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
    func lunarDate(time:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale=Locale(identifier: "zh_CN")
        formatter.calendar=Calendar.init(identifier: .chinese)
        return formatter.string(from: time)
    }
}

struct datePage_Previews: PreviewProvider {
    @State static var page:String="date"
    static var previews: some View {
        datePage(page:$page)
    }
}
