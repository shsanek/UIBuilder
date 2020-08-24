//
//  UIViewRepresentable+IUIElement.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

import SwiftUI

public struct UIElementDemo: UIViewRepresentable
{

    private let controller: UIController

    public init(_ element: IUIElement)
    {
        self.controller = UIController(element: element)
    }

    public func makeUIView(context: Context) -> UIView
    {
        return self.controller.makeView()
    }

    public func updateUIView(_ uiView: UIView, context: Self.Context)
    {
        self.controller.setView(uiView)
    }
}
