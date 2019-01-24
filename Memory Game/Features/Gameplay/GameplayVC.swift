//
//  GameplayVC.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/23/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import UIKit

class GameplayVC: UIViewController {

    // MARK: - PROPERTIES -

    @IBOutlet weak var collectionView: UICollectionView!

    var cardDeck: CardDeck?
    var gridSize: (rows: Int, columns: Int)? {
        didSet {
            guard let gridSize = gridSize else { return }
            cardDeck = CardDeck(numberOfCards: gridSize.rows * gridSize.columns)
        }
    }

    // MARK: - OVERRIDE FUNCTIONS -

    override func viewDidLoad() {
        super.viewDidLoad()

        displayCustomBackButton()
        setupCollectionView()
    }

}
