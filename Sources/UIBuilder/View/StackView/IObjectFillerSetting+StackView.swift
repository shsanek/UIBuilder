//
//  IViewFiller+StackView.swift
//  UIBuilder
//
//  Created by Шипин Александрon 24.08.2020.
//

public typealias BStack<Content> = ViewFiller<StackView<Content>>

extension IObjectFillerSetting where ObjectType: IStackView, Self: IObjectFillerInitable
{

    public init(@StackBuilder contentBuilder: () -> StackViewContent<ObjectType.Content>)
    {
        let content = contentBuilder()
        self = Self().addFillHandler({ (stackView) in
            content.setContent(stackView)
        })
    }

}
