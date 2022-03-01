//
//  UserInfoView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/28.
//

import SwiftUI

struct UserInfoView: View {
    
    @State var name = ""
    
    var body: some View {
        
        let userInfoViewBounds = UIScreen.main.bounds
        let userInfoVieWwidth = userInfoViewBounds.width
        let userInfoViewHeight = Int(userInfoViewBounds.height)
        let uiWidth = userInfoVieWwidth / 1.3
        
        ZStack {
            Color.yellow
                .ignoresSafeArea(.all)
            
            VStack {
                //名前
                TextField("名前", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: uiWidth)
                    .padding()
                //名前更新ボタン
                Button("名前を更新", action: {
                    print("名前を更新ボタン押下")
                })
                    .frame(width: uiWidth, height: 40)
                    .background(.pink)
                
            }
        }
    }
}
