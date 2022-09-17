//
//  ContentView.swift
//  Scrap
//
//  Created by 김영선 on 2022/09/05.
//

import SwiftUI

struct LoginView: View {
    @State private var id: String = ""
    @State private var pw: String = ""
    @State private var showPW = false //비밀번호 visible, invisible
    @State private var keepLogin = false
    @State private var showingSignUpSheet = false //회원가입 sheet state property
    @State private var rootView = false
    
    let light_gray = Color(red: 217/255, green: 217/255, blue: 217/255)
    let bold_sub_gray = Color(red: 151/255, green: 151/255, blue: 151/255)
    let light_blue = Color(red: 70/255, green: 193/255, blue: 241/255)
    let error_red = Color(red: 255/255, green: 84/255, blue: 84/255)
    
    var body: some View {
        NavigationView{
            VStack{
                Text("스크랩")
                    .font(.system(size: 64, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 64)
                VStack(spacing: 32){
                    TextField("아이디", text: $id)
                        .disableAutocorrection(true) //자동 수정 비활성화
                        .padding(.horizontal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(light_gray)
                                .frame(height: 40, alignment: .center)
                        )
                    HStack{
                        if showPW {
                            HStack{
                                TextField("비밀번호", text: $pw)
                                    .disableAutocorrection(true) //자동 수정 비활성화
                                    .padding(.horizontal)
                                    
                                Button(action: {
                                    self.showPW.toggle()
                                }) {
                                    Image(systemName: "eye")
                                        .resizable()
                                        .frame(width: 20, height: 13)
                                        .foregroundColor(light_gray)
                                }
                                .padding(.trailing, 12)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(light_gray)
                                    .frame(height: 42, alignment: .center)
                            )
                        }
                        else {
                            HStack{
                                SecureField("비밀번호", text: $pw)
                                    .disableAutocorrection(true) //자동 수정 비활성화
                                    .padding(.horizontal)
                                    
                                Button(action: {
                                    self.showPW.toggle()
                                }) {
                                    Image(systemName: "eye.slash")
                                        .resizable()
                                        .frame(width: 20, height: 15)
                                        .foregroundColor(light_gray)
                                }
                                .padding(.trailing, 12)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(light_gray)
                                    .frame(height: 42, alignment: .center)
                            )
                        }
                        
                    }
                }
                .padding(.horizontal, 50)
                HStack(){ //로그인 유지 체크 박스
                    Text("아이디/비밀번호가 맞지 않습니다.") //관련 에러 메세지 따로 출력되도록
                        .font(.caption)
                        .foregroundColor(error_red)
                        .lineLimit(0)
                        .padding(.leading, 4)
//                        .hidden()
                    Spacer()
                    HStack{
                        Button(action: {
                            //stayLogin
                            self.keepLogin.toggle()
                        }) {
                            if keepLogin {
                                Image(systemName: "checkmark.square")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(light_gray)
                            }else{
                                Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(light_gray)
                            }
                        }
                        .frame(width: 8, height: 8)
                        Text("로그인 유지")
                            .font(.system(size: 14, weight: .light))
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 100, height: 40)
                
                VStack(spacing: 12){
                    Button(action: { //login button
                    
                    }) {
                        Text("로그인")
                            .frame(width: UIScreen.main.bounds.width-120, height: 28, alignment: .center)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(10)
                            .background(light_blue)
                            .cornerRadius(12)
                    }
                    HStack{
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width/3.1, height: 1)
                            .foregroundColor(light_gray)
                        Text("or")
                            .foregroundColor(light_gray)

                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width/3.1, height: 1)
                            .foregroundColor(light_gray)
                    }
                    .padding(.vertical)
                    Button(action: { //login button
                        //카카오로 연결
                    }) {
                        Image("kakao_login_large_narrow")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 1.8, height: 52, alignment: .center)
                    }
                }
                
                NavigationLink(destination: SignUpView(rootView: $rootView), isActive: $rootView){
                    Text("회원가입")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(bold_sub_gray)
                        .underline()
                }
//                Button(action: {
//                    self.showingSignUpSheet.toggle()
//                }){
//                    Text("회원가입")
//                        .font(.system(size: 16, weight: .medium))
//                        .foregroundColor(Color.gray)
//                        .underline()
//                }
//                .fullScreenCover(isPresented: $showingSignUpSheet) {
//                    //sheet에 표시될 뷰를 할당
//                    SignUpView()
//                }
                .padding(.top, 12)
            }
            .padding(.bottom, 80)
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
