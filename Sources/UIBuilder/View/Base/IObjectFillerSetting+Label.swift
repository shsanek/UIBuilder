//
//  IObjectFillerSetting+Label.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

import UIKit

public typealias BLabel = ViewFiller<UILabel>

extension IObjectFillerSetting where ObjectType: UILabel
{

    public func text(_ text: String?) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.text = text
        }
    }

    public func textColor(_ color: UIColor) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.textColor = color
        }
    }

    public func font(_ font: UIFont) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.font = font
        }
    }

    public func attributedText(_ attributedText: NSAttributedString?) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.attributedText = attributedText
        }
    }

    public func textAlignment(_ textAlignment: NSTextAlignment) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.textAlignment = textAlignment
        }
    }

}

extension IObjectFillerSetting where ObjectType: UILabel, Self: IObjectFillerInitable
{

    public init(_ text: String?)
    {
        self = Self.init().text(text)
    }

    public init(_ attributedText: NSAttributedString?)
    {
        self = Self.init().attributedText(attributedText)
    }

}


