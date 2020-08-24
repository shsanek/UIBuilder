//
//  ViewController.swift
//  Demo
//
//  Created by Шипин Александр on 24.08.2020.
//  Copyright © 2020 Alexandr Shipin. All rights reserved.
//

import UIKit
import UIBuilder

class ViewController: UIViewController
{

    private let controller = UIController(element: TextInput())

    override func loadView() {
        self.view = self.controller.makeView()
        controller.setView(self.view)
    }

}
