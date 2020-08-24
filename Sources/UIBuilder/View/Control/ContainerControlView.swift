//
//  ContainerControl.swift
//  UIBuilder
//
//  Created by Шипин Александр on 24.08.2020.
//

import UIKit

public protocol IContainerControlView: AnyObject
{

    associatedtype ContentType: UIView

    var fillerMaker: ((_ isTouch: Bool) -> ViewFiller<ContentType>)? { get set }
    var clickHandler: (() -> Void)? { get set }

}

public class ContainerControlView<ContentView: UIView>: UIControl, IContainerControlView
{

    public var fillerMaker: ((_ isTouch: Bool) -> ViewFiller<ContentView>)? {
        didSet {
            self.updateState()
        }
    }
    public var clickHandler: (() -> Void)? = nil

    internal let contentView = ContentView()

    private var isTouch: Bool = false

    internal init()
    {
        super.init(frame: .zero)
        self.configure()
    }

    internal required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    public override func cancelTracking(with event: UIEvent?)
    {
        super.cancelTracking(with: event)
        self.cancelTouch()
    }

    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?
    {
        let view = super.hitTest(point, with: event)
        if view is UIControl || view?.gestureRecognizers?.count ?? 0 > 0
        {
            return view
        }
        return self
    }

    private func configure()
    {
        self.backgroundColor = .clear
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.contentView)

        self.updateState()
        self.setHooks()
    }


    private func setHooks()
    {
        self.addTarget(self, action: #selector(didTouch), for: .touchUpInside)
        self.addTarget(self, action: #selector(startTouch), for: .touchDown)

        self.addTarget(self, action: #selector(cancelTouch), for: .touchDragExit)
        self.addTarget(self, action: #selector(cancelTouch), for: .touchUpOutside)
        self.addTarget(self, action: #selector(cancelTouch), for: .touchCancel)
    }

    @objc private func startTouch()
    {
        if self.isTouch == false
        {
            self.isTouch = true
            self.updateState()
        }
    }

    @objc private func cancelTouch()
    {
        if self.isTouch
        {
            self.isTouch = false
            self.updateState()
        }
    }

    @objc private func didTouch()
    {
        self.runAction()
    }

    private func updateWithDelay()
    {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.updateState()
        }
    }

    private func updateState()
    {
        self.fillerMaker?(self.isTouch).fill(self.contentView)
    }

    private func runAction()
    {
        if self.isTouch == false
        {
            return
        }
        self.updateState()
        self.isTouch = false
        self.updateWithDelay()
        self.clickHandler?()
    }

}
