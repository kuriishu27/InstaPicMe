//
//  UserView.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 20/06/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    ProfileView()
						.frame(width: geo.size.width, height: 90)
                    AboutMeView()
                        .frame(width: geo.size.width, height: 90)
                    HighlightsView()
                        .frame(height: 90)

                    Divider()

                    HStack {
                        Button(action: {

                        }) {
                            Image(systemName: "circle.grid.3x3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                        .foregroundColor(Color.black)
                        .padding(15)

                        Spacer()
                        Button(action: {

                        }) {
                            Image(systemName: "rectangle.stack.person.crop")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                        .foregroundColor(Color.black)
                        .padding(10)

                    }
                    .frame(width: 200)

                    VStack(alignment: .leading) {
                        ForEach(0..<10) { _ in
                            HStack {
                                Image("nature-\(Int.random(in: 1...9))")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                                    .cornerRadius(0)
                                    .padding(.trailing, -8)
                                Image("nature-\(Int.random(in: 1...9))")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                                    .cornerRadius(0)
                                    .padding(.trailing, -8)

                                Image("nature-\(Int.random(in: 1...9))")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                                    .cornerRadius(0)

                            }
                            .padding(-5)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserView()
                .previewLayout(.sizeThatFits)
        }
    }
}
