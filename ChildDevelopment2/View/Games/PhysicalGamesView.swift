//
//  PhysicalGamesView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 05.01.2023.
//

import SwiftUI

struct PhysicalGamesView: View {
    
    @ObservedObject var model = ViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
    
        List (model.listOne) { item in
            Text(item.description)
        }.font(Font.custom("Noteworthy", size: 20))
    
            .navigationBarTitle("Физ. развитие", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrowshape.turn.up.backward")
            }))
        
    }
    
    init() {
        model.getData(section: "physicalGames")
    }
    
}

struct PhysicalGamesView_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalGamesView()
    }
}
