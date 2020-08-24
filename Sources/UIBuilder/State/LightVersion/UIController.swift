//
//  UIController.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

public final class UIController
{

    private let element: IUIElement
    private var view: UIView?

    public init(element: IUIElement)
    {
        self.element = element
        Mirror(reflecting: element).children.forEach { (child) in
            if let notification = child.value as? IStateUpdatable
            {
                notification.updateHandler = { [weak self] in
                    self?.update()
                }
            }
        }
    }

    public func makeView() -> UIView
    {
        return self.element.body.makeView()
    }

    public func setView(_ view: UIView?)
    {
        self.view = view
        self.update()
    }

    private func update()
    {
        if let view = view
        {
            self.element.body.fill(view)
        }
    }

}
