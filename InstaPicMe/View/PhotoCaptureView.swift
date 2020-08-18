//
//  PhotoCaptureView.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 17/07/2020.
//  Copyright © 2020 Christian Ray Leovido. All rights reserved.
//

import SwiftUI

struct PhotoCaptureView: View {

    @Binding var showImagePicker: Bool
    @Binding var image: Image?


    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

#if DEBUG
struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
#endif
