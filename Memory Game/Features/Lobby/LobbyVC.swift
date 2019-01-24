//
//  ViewController.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/22/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import UIKit

class LobbyVC: UIViewController {

    @IBAction private func sizeOptionTapped(_ sizeOptionButton: UIButton) {
        let gridSizes = [
            (3,4), (5,2), (4,4), (4,5)
        ]

        let gameplayVC = GameplayVC.instance()
        gameplayVC.gridSize = gridSizes[sizeOptionButton.tag]
        navigationController?.pushViewController(gameplayVC, animated: true)
    }

}

