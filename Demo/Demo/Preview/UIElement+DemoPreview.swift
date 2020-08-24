//
//  UIElement+DemoPreview.swift
//  Demo
//
//  Created by Шипин Александр on 24.08.2020.
//  Copyright © 2020 Alexandr Shipin. All rights reserved.
//

import SwiftUI
import UIBuilder

internal struct TextInput: IUIElement
{

    @UIState var tap: Bool = false

    internal var body: UIBody {
        UIBody {
            BContainer {
                BControl { (isTap) in
                    BContainer {
                        BLabel(self.tap ? "тапнуто" : "не тапнуто")
                            .offset(top: 8, bottom: 8, left: 8, right: 8)
                    }
                    .offset()
                    .backgroundColor(isTap ? .lightGray: .clear)
                }
                .setAction({ self.tap.toggle() })
                .freeOffset(top: 0, left: 0, right: 0)
            }
            .backgroundColor(.white)
        }
    }
    
}

struct UIElement_DemoPreview_Previews: PreviewProvider {

    static var previews: some View {
        UIElementDemo(TextInput())
            .previewLayout(.fixed(width: 300, height: 60))
    }
}
