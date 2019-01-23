//
//  UINavigationController.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/23/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import UIKit

extension UIViewController {

    // MARK: - PUBLIC METHODS -

    func displayCustomBackButton() {
        let backNavButton = UIButton(type: .custom)
        backNavButton.setImage(UIImage(named:"backNavButton"), for: .normal)
        backNavButton.addTarget(self, action: #selector(customBackButtonAction), for: UIControl.Event.touchUpInside)
        let backNavBarItem = UIBarButtonItem(customView: backNavButton)
        backNavBarItem.customView?.widthAnchor.constraint(equalToConstant: 51).isActive = true
        navigationItem.leftBarButtonItem = backNavBarItem
    }

    // MARK: - PRIVATE METHODS -

    @objc private func customBackButtonAction() {
       navigationController?.popViewController(animated: true)
    }

}

