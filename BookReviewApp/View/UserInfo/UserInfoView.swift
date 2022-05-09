//
//  UserInfoView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/28.
//

import SwiftUI

struct UserInfoView: View {
    
    @State var name: String = ""
    
    var body: some View {
        
        var errMessage: [String] = []
        let userInfoViewBounds = UIScreen.main.bounds
        let userInfoVieWwidth = userInfoViewBounds.width
        let userInfoViewHeight = Int(userInfoViewBounds.height)
        let uiWidth = userInfoVieWwidth / 1.3
        
        ZStack {
            Color.yellow
                .ignoresSafeArea(.all)
            
            VStack {
                //タイトル
                Text("ユーザー情報更新")
                    .foregroundColor(.green)
                
                //名前
                TextField("名前", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: uiWidth)
                    .padding()
                
                //名前更新ボタン
                Button("名前を更新", action: {
                    print("名前を更新ボタン押下")
                    let checkNameResult = Validator.shared.checkName(name: name, min: 1, max: 50)
                    if(checkNameResult.isValid == false){ errMessage.append(checkNameResult.isError)
                    }
                    if (errMessage.isEmpty){
                        print("OK")
                    }else{
                        print(errMessage)
                    }
                })
                    .frame(width: uiWidth, height: 40)
                    .background(.pink)
                
            }
        }
    }
}
