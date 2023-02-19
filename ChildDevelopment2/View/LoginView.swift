//
//  LoginView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 04.01.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var message = ""
    @State private var alert = false
    @State private var show = true
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack {
            let colors = Gradient(colors: [Color(#colorLiteral(red: 0.968627451, green: 0.6431372549, blue: 0.6431372549, alpha: 1)), Color(#colorLiteral(red: 0.9960784314, green: 0.7450980392, blue: 0.5490196078, alpha: 1))])
            LinearGradient(gradient: colors, startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: -10.0) {
                    Button {
                        self.show.toggle()
                        opacity = 0.0
                    } label: {
                        Text("Регистрация")
                            .font(Font.custom("Noteworthy", size: 20))
                            .foregroundColor(.black)
                            .opacity(opacity)
                    }
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.vertical, 10.0)
                    
                    VStack(spacing: 20.0) {
                        VStack(spacing: -20.0) {
                            TextField("Логин", text: $login)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            SecureField("Пароль", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                        VStack {
                            Button {
                                signUpWithEmail(email: self.login, password: self.password) { (verified, status) in
                                    if !verified {
                                        self.message = status
                                        self.alert.toggle()
                                    }
                                    else {
                                        UserDefaults.standard.set(true, forKey: "status")
                                        self.show.toggle()
                                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                    }
                                }
                            } label: {
                                Text("Регистрация")
                                    .font(Font.custom("Noteworthy", size: 20))
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(width: 220, height: 40)
                                    .padding(.horizontal)
                                    .background(Color.clear)
                                    .border(Color.white, width: 3)
                                    .cornerRadius(20)
                            }.alert(isPresented: $alert) {
                                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                            }
                            Button {
                                opacity = 1.0
                            } label: {
                                Text("Назад")
                                    .font(Font.custom("Noteworthy", size: 20))
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(width: 220, height: 40)
                                    .padding(.horizontal)
                                    .background(Color.clear)
                                    .border(Color.white, width: 3)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 70, height: 370)
                .background(Color(#colorLiteral(red: 1, green: 0.9843137255, blue: 0.7568627451, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: -20)
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.vertical, 10.0)
                    VStack(spacing: 20.0) {
                        VStack(spacing: -20.0) {
                            TextField("Логин", text: $login)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            SecureField("Пароль", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                        VStack {
                            Button {
                                signInWithEmail(email: self.login, password: self.password) { (verified, status) in
                                    if !verified {
                                        self.message = status
                                        self.alert.toggle()
                                    }
                                    else {
                                        UserDefaults.standard.set(true, forKey: "status")
                                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                    }
                                }
                            } label: {
                                Text("Войти")
                                    .font(Font.custom("Noteworthy", size: 20))
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(width: 220, height: 40)
                                    .padding(.horizontal)
                                    .background(Color.clear)
                                    .border(Color.white, width: 3)
                                    .cornerRadius(20)
                            }.alert(isPresented: $alert) {
                                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                            }
                        }.padding()
                    }
                }
                .background(Color(#colorLiteral(red: 0.7137254902, green: 0.8862745098, blue: 0.631372549, alpha: 1)))
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.width - 40, height: 420)
                .shadow(radius: 20)
                .opacity(opacity)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
