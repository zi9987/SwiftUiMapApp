//
//  LocationMapAnnotationView.swift
//  SwiftUiMapApp
//
//  Created by 羅子淵 on 2024/7/16.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")

    var body: some View {
        VStack{
            Image(systemName:"map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)

            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10,height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-6)
                .padding(.bottom,40)
        }
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        LocationMapAnnotationView()
    }
}
