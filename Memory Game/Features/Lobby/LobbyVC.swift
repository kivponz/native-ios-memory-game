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
        var gridSize = (columns: 0, rows: 0)

        switch sizeOptionButton.tag {
        case 0: gridSize = (3,4)
        case 1: gridSize = (5,2)
        case 2: gridSize = (4,4)
        case 3: gridSize = (4,5)
        default: ()
        }

        let gameplayVC = GameplayVC.instance()
        gameplayVC.gridSize = gridSize
        navigationController?.pushViewController(gameplayVC, animated: true)
    }

}

