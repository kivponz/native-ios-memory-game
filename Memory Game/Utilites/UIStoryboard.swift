//
//  UIStoryboard.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/23/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import UIKit

extension UIStoryboard {

    func initialViewController<T: UIViewController>() -> T {
        return self.instantiateInitialViewController() as! T
    }
    
}
