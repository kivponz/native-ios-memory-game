//
//  UIStoryboard.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/23/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import UIKit

extension UIViewController {

    class func instance() -> Self {
        let storyboardName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.initialViewController()
    }
}

extension UIStoryboard {
    func initialViewController<T: UIViewController>() -> T {
        return self.instantiateInitialViewController() as! T
    }
}
