//
//  ImageProviderTask.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

public typealias ImageProvider = (_ completion: @escaping (UIImage?) -> Void) -> Void

internal final class ImageProviderTask
{

    private let completionHandler: (UIImage?) -> Void

    internal init(request: @escaping ImageProvider, completion: @escaping ((UIImage?) -> Void))
    {
        self.completionHandler = completion
        request({ [weak self] in self?.didLoad($0) })
    }

    internal func didLoad(_ image: UIImage?)
    {
        self.completionHandler(image)
    }

}
