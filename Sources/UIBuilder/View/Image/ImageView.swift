//
//  ImageView.swift
//  UIBuilder
//
//  Created by Шипин Александрon 24.08.2020.
//

import UIKit

public final class ImageView: UIImageView
{

    private var task: ImageProviderTask?

    public override var image: UIImage? {
        didSet {
            self.task = nil
        }
    }

    public func setImageProvider(_ imageProvider: @escaping ImageProvider)
    {
        self.task = ImageProviderTask(request: imageProvider, completion: { [weak self] (image) in
            self?.image = image
        })
    }

}
