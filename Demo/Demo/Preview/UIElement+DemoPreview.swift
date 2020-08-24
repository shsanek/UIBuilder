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

    @UIState var active: Bool = false

    internal var body: UIBody {
        UIBody {
            BContainer {
                BStack {
                    BTextField()
                        .placeholder("input")
                        .height(44)
                        .updateTextHandler { (text) in
                            self.active = (text?.count != 0)
                        }
                    BView().height(8.0)
                    BView()
                        .height(4.0)
                        .backgroundColor(self.active ? .green : .red)
                }
                .setAxis(.vertical)
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
