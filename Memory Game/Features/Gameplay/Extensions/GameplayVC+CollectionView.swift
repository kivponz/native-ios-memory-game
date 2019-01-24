//
//  GameplayVC+CollectionViewDelegate.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/23/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import UIKit

extension GameplayVC {

    func setupCollectionView() {
        collectionView.register(UINib(nibName: String(describing: CardCell.self), bundle: nil),
                                forCellWithReuseIdentifier: CardCell.identifier)
        collectionView.reloadData()
    }

}

// MARK: - DATA SOURCE -

extension GameplayVC: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return cardDeck?.numberOfCards ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier,
                                                            for: indexPath) as? CardCell else {
            fatalError("Error getting CardCell")
        }
        cell.card = cardDeck?.card(at: indexPath.item)
        return cell
    }

}

// MARK: - DELEGATE -

extension GameplayVC: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CardCell else {
            fatalError("Error getting CardCell")
        }
        guard let card = cell.card else { return }
        cell.showCard(true)

        // If only one card is open or if it's a match, will return a nil. Do nothing.
        // Else it will return unmatched cards if two cards are open and not a match
        if let unmatchedCards = cardDeck?.isMatch(card: card) {
            // hide open cards
            for card in unmatchedCards {
                guard let index = cardDeck?.index(for: card) else { continue }
                let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as? CardCell
                DispatchQueue.main.async {
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in
                        cell?.showCard(false)
                    })
                }
            }
        }
    }

}


// MARK: - FLOW LAYOUT -

extension GameplayVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemWidth = collectionView.frame.width / 5.0 - 10.0
        let itemHeight = itemWidth * 1.4 // 1.4 is image ratio
        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        let width = collectionView.frame.width / 5.0
        let padding = (collectionView.frame.width - (width * CGFloat(gridSize?.columns ?? 0))) / 2.0
        return UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: padding)
    }

}
