//
//  UIBody.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

public final class UIBody
{

    private let makeViewHandler: () -> UIView
    private let fillHandler: (_ view: UIView) -> Void
    private let type: UIView.Type

    public init<ViewFiller: IViewFiller>(_ builder: () -> ViewFiller)
    {
        let filler = builder()
        self.type = ViewFiller.ObjectType.self
        self.makeViewHandler = { ViewFiller.ObjectType() }
        self.fillHandler = { view in
            guard let view = view as? ViewFiller.ObjectType else
            {
                fatalError()
            }
            filler.fill(view)
        }
    }

    internal func makeView() -> UIView
    {
        return self.makeViewHandler()
    }


    internal func fill(_ view: UIView)
    {
        self.fillHandler(view)
    }

}
