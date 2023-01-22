//
//  CreativeGamesView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 06.01.2023.
//

import SwiftUI

struct CreativeGamesView: View {
    
    @ObservedObject var model = ViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
    
        List (model.creativeGamesList) { item in
            Text(item.description)
        }.font(Font.custom("Noteworthy", size: 20))
    
            .navigationBarTitle("Творчество", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrowshape.turn.up.backward")
            }))
        
    }
    
    init() {
        model.getData(section: "creativeGames")
    }
}

struct CreativeGamesView_Previews: PreviewProvider {
    static var previews: some View {
        CreativeGamesView()
    }
}
