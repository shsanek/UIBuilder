//
//  IObjectFillerSetting+ContainerView.swift
//  UIBuilder
//
//  Created by Шипин Александрon 24.08.2020.
//

public typealias BContainer<ViewType: UIView> = ViewFiller<ContainerView<ViewType>>

extension IObjectFillerSetting where ObjectType: IContainerView, Self: IObjectFillerInitable
{

    public init<FillerType: IObjectFiller>(_ contentBuilder: () -> FillerType) where FillerType.ObjectType == ObjectType.ContentType
    {
        let filler = contentBuilder()
        self = Self.init().addFillHandler { (obj) in
            filler.fill(obj.contentView)
        }
    }
}
