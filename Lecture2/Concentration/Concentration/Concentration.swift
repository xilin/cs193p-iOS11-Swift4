//
//  Concentration.swift
//  Concentration
//
//  Created by LinXi on 2018/9/4.
//  Copyright © 2018 Lin. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // HOMEWORK: Shuffle the cards
        for reverseIndex in 1..<cards.count {
            let realIndex = cards.count - reverseIndex
            let toSwapIndex = Int(arc4random_uniform(UInt32(realIndex + 1)))
            cards.swapAt(toSwapIndex, realIndex)
        }
    }
}
