//
//  Ticket.swift
//  Jackpot
//
//  Created by Ben Gohlke on 7/29/19.
//  Copyright © 2019 Ben Gohlke. All rights reserved.
//

import Foundation

struct Ticket {
    var picks = Set<Int>()
    
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
    
    private mutating func createPicks() {
        while picks.count < 6 {
            let pick = Int.random(in: 1...53)
            picks.insert(pick)
        }
        
        print(picks)
    }
}
