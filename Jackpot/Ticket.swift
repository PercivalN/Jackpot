//
//  Ticket.swift
//  Jackpot
//
//  Created by Ben Gohlke on 7/29/19.
//  Copyright © 2019 Ben Gohlke. All rights reserved.
//

import Foundation

enum Payout: String {
    case none = ""
    case small = "$1"
    case medium = "$500"
    case large = "$1000"
    case jackpot = "$100,000"
}

class Ticket {
    var picks = Set<Int>()
    var payout: Payout = .none
    
    var description: String {
        var numbers = ""
        for aPick in picks.sorted() {
            numbers = numbers + " " + String(format: "%02i", aPick)
        }
        return numbers
    }
    
    init() {
        createPicks()
    }
    
    init(picks: Set<Int>) {
        self.picks = picks
    }
    
    private func createPicks() {
        while picks.count < 6 {
            let pick = Int.random(in: 1...53)
            picks.insert(pick)
        }
        
        print(picks)
    }
    
    func compare(with ticket: Ticket) {
        var matchCount = 0
        
        for aPick in ticket.picks {
            if picks.contains(aPick) {
                matchCount += 1
            }
        }
        
        switch matchCount {
        case 3:
            payout = .small
        case 4:
            payout = .medium
        case 5:
            payout = .large
        case 6:
            payout = .jackpot
        default:
            payout = .none
        }
        
    }
}
