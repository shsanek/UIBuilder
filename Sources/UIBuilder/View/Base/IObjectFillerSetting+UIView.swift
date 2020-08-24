//
//  IObjectFillerSetting+UIView.swift
//  UIBuilder
//
//  Created by Шипин Александрon 24.08.2020.
//

import UIKit

public typealias BView = ViewFiller<UIView>

extension IObjectFillerSetting where ObjectType: UIView
{

    public func backgroundColor(_ color: UIColor) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.backgroundColor = color
        }
    }

    public func cornerRadius(_ value: CGFloat) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.layer.cornerRadius = value
        }
    }

    public func borderColor(_ color: UIColor) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.layer.borderColor = color.cgColor
        }
    }

    public func borderWidth(_ value: CGFloat) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.layer.borderWidth = value
        }
    }

    public func clipsToBounds(_ value: Bool) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.clipsToBounds = value
        }
    }

    public func tintColor(_ color: UIColor) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.tintColor = color
        }
    }

}
