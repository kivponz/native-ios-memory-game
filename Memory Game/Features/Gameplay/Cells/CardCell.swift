//
//  CardCell.swift
//  Memory Game
//
//  Created by Pavel Novik on 1/23/19.
//  Copyright © 2019 Novik. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {

    // MARK: - PROPERTIES -

    static let identifier = "CardCellIdentifier"

    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!

    var card: Card? {
        didSet {
            frontImageView.image = UIImage(named: card?.imageName ?? "")
        }
    }

    // MARK: - FUNCTIONS -

    func showCard(_ show: Bool) {
        isUserInteractionEnabled = !show

        UIView.transition(from: show ? backImageView : frontImageView,
                          to: show ? frontImageView : backImageView,
                          duration: 0.5,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
    }

}
