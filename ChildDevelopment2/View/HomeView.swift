//
//  HomeView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 04.01.2023.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Noteworthy-Bold", size: 20)!]
    }
    
    @ObservedObject var model = ViewModel()
    @State private var showPopOver = false
    @State private var sectionss = ["Физ. развитие", "Мелкая моторика", "Логика", "Развитие речи", "Сенсорика", "Бытовые навыки", "Творчество", "Эмоции"]
    @State private var textC = 0
    @State private var citates = ["1. Детей учит то, что их окружает.",
                                  "2. Если ребенка часто критикуют — он учится осуждать.",
                                  "3. Если ребенка часто хвалят — он учится оценивать.",
                                  "4. Если ребенку демонстрируют враждебность — он учится драться.",
                                  "5. Если с ребенком честны — он учится справедливости.",
                                  "6. Если ребенка часто высмеивают — он учится быть робким.",
                                  "7. Если ребенок живет с чувством безопасности — он учится верить.",
                                  "8. Если ребенка часто позорят — он учится чувствовать себя виноватым.",
                                  "9. Если ребенка часто одобряют — он учится хорошо к себе относиться.",
                                  "10. Если к ребенку часто бывают снисходительны — он учится быть терпеливым."]
    @State private var txtOne = Text("*заповеди Марии Монтессори")
    @State private var opacity = 0.0
    @State private var show = false
    @State private var tagSelection: String? = nil
    
    
    var body: some View {
        NavigationView {
            ZStack {
                let colors = Gradient(colors: [Color(#colorLiteral(red: 0.8103023537, green: 0.9558948291, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8383045374, green: 0.8378430055, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7675836037, blue: 0.9384834339, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7901360076, blue: 0.6399320168, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.9535365339, blue: 0.4870987345, alpha: 1)), Color(#colorLiteral(red: 0.4871984882, green: 0.8837181631, blue: 0.6868290956, alpha: 1))])
                LinearGradient(gradient: colors, startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                    .navigationBarTitle("Развивающие игры для детей", displayMode: .inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        self.showPopOver.toggle()
                        
                    }, label: {
                        Image(systemName: "questionmark.app")
                            .foregroundColor(.black)
                    })
                    )
                    .navigationBarItems(leading:
                                            Button(action: {
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    }, label: {
                        Image(systemName: "x.square")
                    }))
                    
                
                VStack(spacing: 60.0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 8) { item in
                                GeometryReader { geometry in
                                    
                                    NavigationLink(destination: PhysicalGamesView(), tag: "view1", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: LogicalGamesView(), tag: "view2", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: EmotionalGamesView(), tag: "view3", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    
                                    Button {
//                                        self.show.toggle()
                                        if item == 0 {
                                            tagSelection = "view1"
                                        } else if item == 1 {
                                            tagSelection = "view2"
                                        } else {
                                            tagSelection = "view3"
                                        }

                                    } label: {
                                        VStack {
                                            Image(self.sectionss[item])
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 300, height: 110, alignment: .top)
                                            Text(self.sectionss[item])
                                                .font(Font.custom("Noteworthy", size: 20))
                                                .bold()
                                                .foregroundColor(.black)
                                        }
                                        
                                    }.frame(width: 240, height: 220)
                                        .background(Color(#colorLiteral(red: 1, green: 0.9535365339, blue: 0.4870987345, alpha: 1)))
                                        .cornerRadius(20)
                                        .shadow(radius: 5)
                                        .padding()
                                        .rotation3DEffect(Angle(degrees: geometry.frame(in: .global).minX / -20), axis: (x: 0, y: 10, z: 0))
                                        
                                    
                                }.frame(width: 270, height: 250)
                                    
                            }
                            
                        }
                    }
                    
                    Button {
//                        self.show.toggle()
                    } label: {
                        Text("План занятий на день")
                            .font(Font.custom("Noteworthy", size: 20))
                            .bold()
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .background(Color.clear)
                            .border(Color.gray, width: 3)
                            .cornerRadius(20)
                    }
                    
                    
                    VStack(spacing: 1.0) {
                        
                        VStack(spacing: 5.0) {
                            
                            Text(citates[textC])
                                .font(Font.custom("Noteworthy", size: 19))
                            
                                .multilineTextAlignment(.center)
                                .frame(width: UIScreen.main.bounds.width - 40, height: 75)
                                .animation(Animation.easeInOut(duration: 2))
                            
                            txtOne
                                .font(Font.custom("Noteworthy", size: 17))
                                .bold()
                                .multilineTextAlignment(.leading)
                            
                        }
                        
                        
                        Button {
                            
                            textC += 1
                            if textC > 9 {
                                textC = 0
                            }
                            
                            
                            
                            
                            
                        } label: {
                            
                            
                            Image("next")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 64, height: 64)
                        }
                    }
                    
                    
                    
                    PopOverView()
                        .offset(y: showPopOver ? 0 : 600)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    
                }
                .padding(.top, 230.0)
                
                
            }
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
