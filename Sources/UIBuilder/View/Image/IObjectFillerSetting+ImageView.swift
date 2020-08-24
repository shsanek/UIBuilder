//
//  IObjectFillerSetting+ImageView.swift
//  UIBuilder
//
//  Created by Шипин Александрon 24.08.2020.
//

public typealias BImage = ViewFiller<ImageView>

extension IObjectFillerSetting where ObjectType: ImageView
{

    public func imageProvider(_ provider: @escaping ImageProvider) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.setImageProvider(provider)
        }
    }

}

extension IObjectFillerSetting where ObjectType: ImageView, Self: IObjectFillerInitable
{

    public init(_ provider: @escaping ImageProvider)
    {
        self = Self.init().imageProvider(provider)
    }

}

extension IObjectFillerSetting where ObjectType: UIImageView
{

    public func image(_ image: UIImage?) -> Self
    {
        return self.addFillHandler { (obj) in
            obj.image = image
        }
    }

}

extension IObjectFillerSetting where ObjectType: UIImageView, Self: IObjectFillerInitable
{

    public init(_ image: UIImage?)
    {
        self = Self.init().image(image)
    }

}
