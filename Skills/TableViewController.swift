//
//  TableViewController.swift
//  Skills
//
//  Created by Vasiliy Vygnych on 27.08.2023.
//

import UIKit

class TableViewController: UITableViewController {
//MARK: - properties
    private var cell = "cell"

    
    let array = ["this is row 1",
                 "this is row 2",
                 "this is row 3",
                 "this is row 4"]
    
    
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        tableView.isScrollEnabled = false
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: cell)
    }
//MARK: - viewWillLayoutSubviews
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250,
                                      height: tableView.contentSize.height)
    }
//MARK: - tableViewCell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell,
                                                 for: indexPath)
        let data = array[indexPath.row]
        cell.textLabel?.text = data
//        self.cellLabel.text = data
        return cell
    }
}
