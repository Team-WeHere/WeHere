//
//  PokeModal.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/22.
//

import SwiftUI

struct PokeModal: View {
    var shown = true
    
    @State private var selected: Category?
    
    var body: some View {
        VStack {
            Text("어떤 장소인가요?")
                .font(Font.theme.title1)
                
            HStack(alignment: .center, spacing: 16) {
                ForEach(Category.categories, id: \.self) { category in
                    Button {
                        selected = category
                    } label: {
                        Image(selected == category
                              ? category.name
                              : "\(category.name)-disabled",
                              label: Text(category.name))
                            .resizable()
                            .frame(width: 45, height: 54)
                    }
                }
            }
            .padding(.vertical, 40)
            
            HStack {
                Button {
                  // TODO: 콕하기
                } label: {
                    Text("폼폼님께 콕 하기")
                        .foregroundColor(selected == nil ? Color.gray03 : Color.white)
                        .frame(width: 188, height: 48)
                        .background(selected == nil ? Color.gray05 : Color.pink02)
                        .cornerRadius(44)
                        .clipped()
                }
                .disabled(selected == nil)
                
                Button {
                  // TODO: Close
                } label: {
                    Text("닫기")
                        .foregroundColor(.white)
                        .frame(width: 88, height: 48)
                        .background(Color.gray02)
                        .cornerRadius(44)
                        .clipped()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 286)
        .background(Color.blue01)
        .cornerRadius(20)
        .clipped()
    }
}

struct PokeModal_Previews: PreviewProvider {
    static var previews: some View {
        PokeModal()
    }
}
