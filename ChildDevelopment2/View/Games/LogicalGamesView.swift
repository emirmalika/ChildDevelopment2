//
//  LogicalGamesView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 06.01.2023.
//

import SwiftUI

struct LogicalGamesView: View {
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        
        List (model.listTwo) { item in
            Text(item.description)
        }.font(Font.custom("Noteworthy", size: 20))
        
        
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
