//
//  TicketsTableViewController.swift
//  Jackpot
//
//  Created by Ben Gohlke on 7/29/19.
//  Copyright © 2019 Ben Gohlke. All rights reserved.
//

import UIKit

class TicketsTableViewController: UITableViewController {

    private var ticketController = TicketController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(ticketController.winningTicket?.description)
    }
    
    // MARK: - Actions
    
    @IBAction func createTicket(_ sender: UIBarButtonItem) {
        ticketController.addRandomTicket()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketController.tickets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath)

        // Configure the cell...
        let ticket = ticketController.tickets[indexPath.row]
        cell.textLabel?.text = ticket.description
        cell.textLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: 17, weight: .regular)

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalWinningTicketSegue" {
            if let navC = segue.destination as? UINavigationController,
                let destVC = navC.viewControllers[0] as? WinningTicketViewController {
                destVC.ticketController = ticketController
            }
        }
    }

}
