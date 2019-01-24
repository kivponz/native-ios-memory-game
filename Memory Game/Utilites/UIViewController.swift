//
//  UINavigationController.swift
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

    func displayCustomBackButton() {
        let backNavButton = UIButton(type: .custom)
        backNavButton.setImage(UIImage(named:"backNavButton"), for: .normal)
        backNavButton.addTarget(self, action: #selector(customBackButtonAction), for: .touchUpInside)
        let backNavBarItem = UIBarButtonItem(customView: backNavButton)
        backNavBarItem.customView?.widthAnchor.constraint(equalToConstant: 51.0).isActive = true
        navigationItem.leftBarButtonItem = backNavBarItem
    }

    @objc private func customBackButtonAction() {
       navigationController?.popViewController(animated: true)
    }
    
}
