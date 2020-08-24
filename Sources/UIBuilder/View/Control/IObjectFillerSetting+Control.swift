//
//  IObjectFillerSetting+Control.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

import Foundation

public typealias BControl<ViewType: UIView> = ViewFiller<ContainerControlView<ViewType>>

extension IObjectFillerSetting where ObjectType: IContainerControlView, Self: IObjectFillerInitable
{

    public init(_ contentBuilder: () -> ViewFiller<ObjectType.ContentType>)
    {
        let filler = contentBuilder()
        self = Self.init().addFillHandler { (obj) in
            obj.fillerMaker = { _ in
                filler
            }
        }
    }

    public init(_ contentBuilder: @escaping (_ isTouch: Bool) -> ViewFiller<ObjectType.ContentType>)
    {
        self = Self.init().addFillHandler { (obj) in
            obj.fillerMaker = contentBuilder
        }
    }


    public func setAction(_ action: @escaping () -> Void) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.clickHandler = action
        }
    }

}
