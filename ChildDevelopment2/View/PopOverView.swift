//
//  PopOverView.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 04.01.2023.
//

import SwiftUI

struct PopOverView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim")
                .font(Font.custom("Noteworthy", size: 20))
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color(#colorLiteral(red: 0.8103023537, green: 0.9558948291, blue: 1, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(radius: 30)
                .padding(.horizontal, 30.0)
            .overlay(
                    Image(systemName: "questionmark.app")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
                    .background(Color.clear)
                        .offset(y: -150)
                    )
        }
        .padding(.bottom, 30.0)        
    }
}

struct PopOverView_Previews: PreviewProvider {
    static var previews: some View {
        PopOverView()
    }
}
