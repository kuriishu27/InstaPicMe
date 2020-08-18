//
//  AboutMeView.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 19/06/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import SwiftUI

struct AboutMeView: View {
	var body: some View {
		GeometryReader { geo in
			VStack(alignment: .leading) {
				HStack {
					Text("Christian Ray Leovido")
					Spacer()
				}
				HStack {
					Text("Software Developer (iOS)")
					Spacer()
				}
			}
			.padding(.leading, 20)
			.frame(width: geo.size.width)
		}
	}
}

struct AboutMeView_Previews: PreviewProvider {
	static var previews: some View {
		AboutMeView()
	}
}
