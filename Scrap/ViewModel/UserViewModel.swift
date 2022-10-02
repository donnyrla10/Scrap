//
//  UserViewModel.swift
//  Scrap
//
//  Created by 김영선 on 2022/10/02.
//

import Foundation

struct LoginModel: Decodable{
    struct Result: Decodable {
        var id: Int?
        
        init(id: Int){
            self.id = id
        }
    }
    let code: Int
    let message: String
    var result: Result?
    
    init(code: Int, message: String, result: Result){
        self.code = code
        self.message = message
        self.result = result
    }
}

struct SignUpModel: Decodable{
    var code: Int
    var message: String
    
    init(code: Int, message: String){
        self.code = code
        self.message = message
    }
}

struct LogOutModel: Decodable{
    let code: Int
    let message: String
    init(code: Int, message: String){
        self.code = code
        self.message = message
    }
}

class UserViewModel: ObservableObject{
    @Published var login = LoginModel(code: 0, message: "", result: LoginModel.Result(id: 0))
    @Published var loginState = false
    @Published var toastMessage = ""
    
    //POST
    //로그인
    func postLogin(userid: String, password: String, autoLogin: Bool){
        guard let url = URL(string: "https://scrap.hana-umc.shop/user/login") else {
            print("invalid url")
            return
        }
        
        let id = userid
        let pw = password
        let autoLogin = autoLogin
        let body: [String: Any] = ["username": id, "password": pw, "autoLogin": autoLogin]
        let finalData = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                if let data = data {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(LoginModel.self, from: data)
                    print("success posting login data")
                    DispatchQueue.main.async {
                        if result.code == 20000 {
                            print("correct login")
                            self.loginState = true
                            print(self.loginState)
                        } else {
                            print("incorrect login")
                            self.loginState = false
                            self.toastMessage = result.message
                            print(self.loginState)
                        }
                    }
                    print(result)
                } else {
                    print("no data")
                }
            }catch (let error){
                print("error")
                print(String(describing: error))
            }
        }.resume()
    }
    
    //회원가입
    func postSignUp(userid: String, password: String, name: String){
        guard let url = URL(string: "https://scrap.hana-umc.shop/user/join") else {
            print("invalid url")
            return
        }

        let username = userid
        let pw = password
        let name = name
        let body: [String: Any] = ["username": username, "password": pw, "name": name]
        let finalData = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do{
                if let data = data {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SignUpModel.self, from: data)
                    print(result)
                } else {
                    print("no data")
                }
            }catch (let error){
                print(String(describing: error))
            }
        }.resume()
    }
    
    //GET
    //로그아웃
    func logOut(){
        guard let url = URL(string: "https://scrap.hana-umc.shop/user/logout") else {
            print("invalid url")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do{
                if let data = data {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(LogOutModel.self, from: data)
                    print(result)
                } else {
                    print("no data")
                }
            }catch (let error){
                print("error")
                print(String(describing: error))
            }
        }.resume()
    }
}
