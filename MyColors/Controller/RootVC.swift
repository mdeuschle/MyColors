//
//  ViewController.swift
//  MyColors
//
//  Created by Matt Deuschle on 4/20/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class RootVC: UITableViewController {

    private var colors = [Color]()

    override func viewDidLoad() {
        super.viewDidLoad()
        WebService.shared.download { success, json in
            DispatchQueue.main.async {
                if success {
                    guard let json = json else { return }
                    json.forEach { color in
                        self.colors.append(color)
                        self.colors.sort { $0.rank < $1.rank }
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ColorCell")
        let color = colors[indexPath.row]
        cell.textLabel?.text = color.title
        cell.detailTextLabel?.text = "Rank: \(color.rank)"
        return cell
    }
}

