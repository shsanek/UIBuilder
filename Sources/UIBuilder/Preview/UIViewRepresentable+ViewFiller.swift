//
//  UIViewRepresentable+ViewFiller.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

import SwiftUI

extension ViewFiller: UIViewRepresentable {
    public func makeUIView(context: Context) -> ObjectType {
        return ObjectType()
    }
    public func updateUIView(_ uiView: ObjectType, context: Self.Context) {
        self.fill(uiView)
    }
}

