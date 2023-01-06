//
//  SignUpView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 04.01.2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var message = ""
    @State private var alert = false
    @State var show: Bool
    
    var body: some View {
        

        ZStack {
            let colors = Gradient(colors: [Color(#colorLiteral(red: 0.8103023537, green: 0.9558948291, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8383045374, green: 0.8378430055, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7675836037, blue: 0.9384834339, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7901360076, blue: 0.6399320168, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.9535365339, blue: 0.4870987345, alpha: 1)), Color(#colorLiteral(red: 0.4871984882, green: 0.8837181631, blue: 0.6868290956, alpha: 1))])
            LinearGradient(gradient: colors, startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
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
                        
                        
        
                    }.padding()
                    
                }
            }
           
            .background(Color(#colorLiteral(red: 0.8103023537, green: 0.9558948291, blue: 1, alpha: 1)))
            .frame(maxWidth: .infinity)
            
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 70, style: .continuous))
            .shadow(radius: 30)
        }
           
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(show: true)
    }
}
