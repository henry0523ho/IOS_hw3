//
//  fbPage.swift
//  hw3
//
//  Created by User03 on 2022/11/16.
//

import SwiftUI

struct article{
    let id=UUID()
    var text:String
    let good:Bool
}

struct fbPage: View {
    @Binding var page:String
    @State var vpn:Bool=false
    @State var myText:String=""
    @State var postNum:Int=1
    @State var curPost:Int=4
    
    @State var allPost:[article]=[article(text: "China No.1\nUSA the last.", good: true)
                           ,article(text: "此生不悔入華夏\n來世還做中國人", good: true),article(text: "習近平小熊維尼\n習包子傻逼", good: false),article(text: "六四天安門\n登入送坦克", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false),article(text: "", good: false)]
    
    var body: some View {
        ZStack{
            VStack{
                Text("hello")
                    .font(.largeTitle)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                List{
                    Toggle(isOn: $vpn, label: {
                        Text("翻牆")
                    })
                    Stepper("最多顯示\(postNum)篇文章", value: $postNum)
                    VStack{
                        Text("New Post")
                        TextEditor(text: $myText).frame( height: 200).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                        Button(action: {
                            
                            allPost[curPost].text=myText
                            curPost=curPost+1
                        }, label: {
                            Text("送出").padding(.all).background(Color(red: 0.3, green: 0.3, blue: 1.0)).foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)).cornerRadius(10.0).border(Color.white, width: 1)
                        })
                    }
                    .padding(.all)
                    showAllPost(allPost: $allPost, vpn: $vpn,postNum: $postNum)
                    
                }
            }
            
            Button(action: {
                page="welcome"
            }, label: {
                Image(systemName: "arrow.left").resizable().scaledToFit().frame(width: 30, height: 30, alignment: .center)
                    .padding(.all).background(Color(red: 0.5, green: 0.5, blue: 0.5)).foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)).cornerRadius(10.0).border(Color.white, width: 1)
            }).position(x: 35.0, y: 35.0)
        }
        
    }
}

struct showAllPost : View{
    @Binding var allPost:[article]
    @Binding var vpn:Bool
    @Binding var postNum:Int
    var body: some View{
        Group{
            ForEach(allPost.indices){
                i in
                if i < postNum{
                    if allPost[i].good==false&&vpn==true{
                        showPost(post: $allPost[i])
                    }else if allPost[i].good==true{
                        showPost(post: $allPost[i])
                    }
                }
                    
            }
        }
    }
}

struct showPost: View{
    @Binding var post:article
    var body: some View{
        if post.text != ""{
            VStack{
            
                if post.good==true{
                    Text("\(post.text)")
                        .frame(width: 300, height: 100, alignment: .center).padding(.all).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)).background(Color(red: 0.7, green: 1, blue: 0.7))
                }else{
                    Text("\(post.text)")
                        .frame(width: 300, height: 100, alignment: .center).padding(.all).overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2)).background(Color(red: 1, green: 0.7, blue: 0.7))
                }
            }
            
        }
        
        
    }
}

struct fbPage_Previews: PreviewProvider {
    @State static var page="fb"
    static var previews: some View {
        fbPage(page:$page)
    }
}
