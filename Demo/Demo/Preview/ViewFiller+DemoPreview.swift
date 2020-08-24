//
//  ViewFiller+DemoPreview.swift
//  Demo
//
//  Created by Шипин Александр on 24.08.2020.
//  Copyright © 2020 Alexandr Shipin. All rights reserved.
//

import SwiftUI
import UIBuilder

struct ViewFiller_DemoPreview_Previews: PreviewProvider {

    static var previews: some View {
        BContainer {
            BStack {
                BLabel("Привет")
                    .textColor(.white)
                BLabel("Это работает очень быстро")
                BLabel("Это работает очень быстро")
                    .textColor(.red)
            }
            .setAxis(.vertical)
            .offset(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0)
        }
        .backgroundColor(.gray)
        .cornerRadius(9.0)
        .previewLayout(.fixed(width: 300, height: 80))
    }
}
