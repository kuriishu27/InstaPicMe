//
//  HighlightsView.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 19/06/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import SwiftUI

struct HighlightsView: View {
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack {
                    VStack {
                        Image(systemName: "plus")
                            .frame(width: 60, height: 60)
                            .cornerRadius(60 / 2)

                        Text("New")
                    }
                    ForEach(1..<5) { value in
                        VStack {
                            Image("bg\(value)")
                            .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .cornerRadius(60 / 2)
                            Text("Be inspired")
                        }
                    }
                }
            }
        }
    }
}

struct HighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightsView()
            .previewLayout(.sizeThatFits)
    }
}
