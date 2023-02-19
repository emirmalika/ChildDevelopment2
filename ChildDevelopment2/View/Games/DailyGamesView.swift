//
//  DailyGamesView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 08.01.2023.
//

import SwiftUI



struct DailyGamesView: View {
    @ObservedObject var model = ViewModel()
    @Environment(\.presentationMode) var presentationMode

    @State private var physicalDescr = UserDefaults.standard.stringArray(forKey: "PhysicalDescr")
    @State private var fMotorDescr = UserDefaults.standard.stringArray(forKey: "FMotorDescr")
    @State private var logicalDescr = UserDefaults.standard.stringArray(forKey: "LogicalDescr")
    @State private var speechDescr = UserDefaults.standard.stringArray(forKey: "SpeechDescr")
    @State private var sensoryDescr = UserDefaults.standard.stringArray(forKey: "SensoryDescr")
    @State private var householdDescr = UserDefaults.standard.stringArray(forKey: "HouseholdDescr")
    @State private var creativeDescr = UserDefaults.standard.stringArray(forKey: "CreativeDescr")
    @State private var emotionalDescr = UserDefaults.standard.stringArray(forKey: "EmotionalDescr")

    var body: some View {
        let randElem1 = physicalDescr?.randomElement() ?? ""
        let randElem2 = fMotorDescr?.randomElement() ?? ""
        let randElem3 = logicalDescr?.randomElement() ?? ""
        let randElem4 = speechDescr?.randomElement() ?? ""
        let randElem5 = sensoryDescr?.randomElement() ?? ""
        let randElem6 = householdDescr?.randomElement() ?? ""
        let randElem7 = creativeDescr?.randomElement() ?? ""
        let randElem8 = emotionalDescr?.randomElement() ?? ""
        let gamesArr = [randElem1, randElem2, randElem3, randElem4, randElem5, randElem6, randElem7, randElem8]

        List {
            Text(gamesArr[0])
            Text(gamesArr[1])
            Text(gamesArr[2])
            Text(gamesArr[3])
            Text(gamesArr[4])
            Text(gamesArr[5])
            Text(gamesArr[6])
            Text(gamesArr[7])
        }
        .font(Font.custom("Noteworthy", size: 20))
            .navigationBarTitle("План занятий на день", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrowshape.turn.up.backward")
            }))
    }
 
    init() {
        UITableView.appearance().backgroundColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0.7568627451, alpha: 1)
    }
}


struct DailyGamesView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGamesView()
    }
}
