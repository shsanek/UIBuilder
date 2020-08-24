//
//  UIState.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

@propertyWrapper
public class UIState<Value>: IStateUpdatable
{

    public var wrappedValue: Value {
        didSet {
            if self.compareHandler(self.wrappedValue, oldValue) == false
            {
                self.updateHandler?()
            }
        }
    }
    internal var updateHandler: (() -> Void)?
    private let compareHandler: (Value, Value) -> Bool

    internal init(wrappedValue: Value,
                  compareHandler: @escaping (Value, Value) -> Bool)
    {
        self.compareHandler = compareHandler
        self.wrappedValue = wrappedValue
    }

    public convenience init(wrappedValue: Value)
    {
        self.init(wrappedValue: wrappedValue,
                  compareHandler: { $0 as AnyObject === $1 as AnyObject })
    }

}

extension UIState where Value: Equatable
{

    public convenience init(wrappedValue: Value)
    {
        self.init(wrappedValue: wrappedValue,
                  compareHandler: { $0 == $1 })
    }

}


internal protocol IStateUpdatable: AnyObject
{

    var updateHandler: (() -> Void)? { get set }

}
