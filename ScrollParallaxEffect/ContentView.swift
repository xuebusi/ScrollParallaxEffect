//
//  ContentView.swift
//  ScrollParallaxEffect
//
//  Created by shiyanjun on 2023/9/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ParallaxEffect()
            ContentList()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ParallaxEffect: View {
    var body: some View {
        GeometryReader { geo in
            let offsetY = geo.frame(in: .global).minY
            let isScrolled = offsetY > 0
            Spacer()
                .frame(height: isScrolled ? 400 + offsetY : 400)
                .background {
                    Image("BG")
                        .resizable()
                        .scaledToFill()
                        .offset(y: isScrolled ? -offsetY : 0)
                        .scaleEffect(isScrolled ? offsetY/2000 + 1 : 1)
                        .blur(radius: isScrolled ? offsetY / 20 : 0)
                }
        }
        .frame(height: 400)
    }
}

struct ContentList: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(0..<10) { _ in
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .frame(width: 120, height: 25)
                    
                    VStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .frame(width: screenWidth * 0.9, height: 20)
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .frame(width: screenWidth * 0.5, height: 20)
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .frame(width: screenWidth * 0.3, height: 20)
                    }
                    .opacity(0.3)
                }
            }
            .padding(.leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top)
        .background(.white)
    }
}
