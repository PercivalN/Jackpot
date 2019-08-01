//
//  WinningTicketViewController.swift
//  Jackpot
//
//  Created by Ben Gohlke on 7/31/19.
//  Copyright © 2019 Ben Gohlke. All rights reserved.
//

import UIKit

class WinningTicketViewController: UIViewController {

    @IBOutlet weak var winningTicketPickerView: UIPickerView!
    
    var ticketController: TicketController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        winningTicketPickerView.dataSource = self
        winningTicketPickerView.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        ticketController?.winningTicket = createWinningTicket()
        ticketController?.decideWinners()
        dismiss(animated: true, completion: nil)
    }
    
    func createWinningTicket() -> Ticket {
        let pick1 = winningTicketPickerView.selectedRow(inComponent: 0) + 1
        let pick2 = winningTicketPickerView.selectedRow(inComponent: 1) + 1
        let pick3 = winningTicketPickerView.selectedRow(inComponent: 2) + 1
        let pick4 = winningTicketPickerView.selectedRow(inComponent: 3) + 1
        let pick5 = winningTicketPickerView.selectedRow(inComponent: 4) + 1
        let pick6 = winningTicketPickerView.selectedRow(inComponent: 5) + 1
        
        let winningTicket = Ticket(picks: [pick1, pick2, pick3, pick4, pick5, pick6])
        
        return winningTicket
    }
}

// MARK: - Picker View Data Source
extension WinningTicketViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 53
    }
}

extension WinningTicketViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
}
