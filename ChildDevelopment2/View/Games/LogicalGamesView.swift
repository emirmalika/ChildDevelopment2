//
//  LogicalGamesView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 06.01.2023.
//

import SwiftUI

struct LogicalGamesView: View {
    
    @ObservedObject var model = ViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        List (model.logicalGamesList) { item in
            Text(item.description)
        }.font(Font.custom("Noteworthy", size: 20))
        
            .navigationBarTitle("Логика", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrowshape.turn.up.backward")
            }))
        
    }
    
    init() {
        model.getData(section: "logicalGames")
    }
    
}

struct LogicalGamesView_Previews: PreviewProvider {
    static var previews: some View {
        LogicalGamesView()
    }
}
