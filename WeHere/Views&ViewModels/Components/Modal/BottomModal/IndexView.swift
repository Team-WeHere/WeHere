//
//  IndexView.swift
//  WeHere
//
//  Created by Chanhee Jeong on 2022/11/21.
//
// ref: https://betterprogramming.pub/custom-paging-ui-in-swiftui-13f1347cf529

import SwiftUI

struct IndexView: View {
    // MARK: - Properties
    
    let currentIndex: Int
    
    private let circleSize: CGFloat = 8
    private let circleSpacing: CGFloat = 7
    
    private let primaryColor = Color.gray02
    private let secondaryColor = Color.gray05
    
    private let smallScale: CGFloat = 0.75
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: circleSpacing) {
          ForEach(0..<2) { index in
            if shouldShowIndex(index) {
              Circle()
                .fill(currentIndex == index ? primaryColor : secondaryColor)
                .scaleEffect(currentIndex == index ? 1 : smallScale)
                .frame(width: circleSize, height: circleSize)
                .id(index)
            }
          }
        }
    }
    
    // MARK: - Private Methods
    
    private func shouldShowIndex(_ index: Int) -> Bool {
      ((currentIndex - 1)...(currentIndex + 1)).contains(index)
    }
}
