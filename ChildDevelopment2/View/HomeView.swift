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
                let colors = Gradient(colors: [Color(#colorLiteral(red: 0.968627451, green: 0.6431372549, blue: 0.6431372549, alpha: 1)), Color(#colorLiteral(red: 0.9960784314, green: 0.7450980392, blue: 0.5490196078, alpha: 1))])
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
                VStack(spacing: 40.0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 8) { item in
                                GeometryReader { geometry in
                                    NavigationLink(destination: PhysicalGamesView(), tag: "view1", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: FMotorGamesView(), tag: "view2", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: LogicalGamesView(), tag: "view3", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: SpeechGamesView(), tag: "view4", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: SensoryGamesView(), tag: "view5", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: HouseholdSkGamesView(), tag: "view6", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: CreativeGamesView(), tag: "view7", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    NavigationLink(destination: EmotionalGamesView(), tag: "view8", selection: $tagSelection) {
                                        EmptyView()
                                    }
                                    Button {
                                        switch item {
                                        case 0:
                                            tagSelection = "view1"
                                        case 1:
                                            tagSelection = "view2"
                                        case 2:
                                            tagSelection = "view3"
                                        case 3:
                                            tagSelection = "view4"
                                        case 4:
                                            tagSelection = "view5"
                                        case 5:
                                            tagSelection = "view6"
                                        case 6:
                                            tagSelection = "view7"
                                        default:
                                            tagSelection = "view8"
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
                                        .background(Color(#colorLiteral(red: 1, green: 0.9843137255, blue: 0.7568627451, alpha: 1)))
                                        .cornerRadius(20)
                                        .shadow(radius: 5)
                                        .padding()
                                        .rotation3DEffect(Angle(degrees: geometry.frame(in: .global).minX / -20), axis: (x: 0, y: 10, z: 0))
                                }.frame(width: 270, height: 250)
                            }
                        }
                    }
                    NavigationLink(destination: DailyGamesView(), tag: "daily", selection: $tagSelection) {
                        EmptyView()
                    }
                    Button {
                        tagSelection = "daily"
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
                .padding(.top, 300.0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
