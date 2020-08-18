//
//  ProfileView.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 19/06/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
		HStack(alignment: .center) {

			Spacer()

            Image("bg2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .background(Color.yellow)
                .cornerRadius(40)

			Spacer(minLength: 5)

            VStack {
                HStack {
                    VStack {
                        Text("20")
                            .fontWeight(.bold)
                        Text("posts")
                            .foregroundColor(Color.gray)
                            .font(.caption)

                    }
                    .padding(5)

                    VStack {
                        Text("10k")
                        .fontWeight(.bold)

                        Text("followers")
                            .foregroundColor(Color.gray)
                            .font(.caption)

                    }
                    .padding(5)

                    VStack {
                        Text("20k")
                        .fontWeight(.bold)

                        Text("following")
                            .foregroundColor(Color.gray)
                            .font(.caption)


                    }
                    .padding(5)

                }
                HStack {
                    Button(action: {
                        print("this will take you to promotions view")
                    }) {
                        Text("Promotions")
                            .fontWeight(.medium)
                            .foregroundColor(Color.black)
                            .padding(5)
                            .border(Color.gray, width: 0.5)
                    }

                    Button(action: {

                    }) {
                        Text("Edit Profile")
                            .fontWeight(.medium)
                        .foregroundColor(Color.black)
                        .padding(5)
                        .border(Color.gray, width: 0.5)
                    }
                }
                .padding(.top, 8)
            }

			Spacer()

        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewLayout(.sizeThatFits)
    }
}
