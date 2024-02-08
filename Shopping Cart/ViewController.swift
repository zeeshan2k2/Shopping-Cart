//
//  ViewController.swift
//  Shopping Cart
//
//  Created by Zeeshan Waheed on 08/02/2024.
//

import UIKit

class ViewController: UITableViewController, UISearchBarDelegate {
    
    var items: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      adding the right bar Plus sign button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(enteringItems))
//      addin the left bar restart sign buton
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reset))
        title = "Shopping Cart"
    }
    
    
    
    //  to display number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    //  to display cell name
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
//  to remove a cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")

        self.items.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    
//  to reset list
    @objc func reset() {
//      removes everything from items array
        items.removeAll()
//      reloads the tableview
        tableView.reloadData()
    }
    
    //  to enter items in the list
    @objc func enteringItems() {
        let ac = UIAlertController(title: nil, message: "Type the item.", preferredStyle: .alert)
//      adding a text field
        ac.addTextField()
        
//      adding submit button functionality
        let SubmitAction = UIAlertAction(title: "Add",
                                         style: .default) { [unowned self, ac] action in
//          This is the text entry after enter key
            let AddedItem = ac.textFields![0]
//          using a function to add items in the uitable view
            self.submit(AddedItem.text!)
        }
        
//      adding the button
        ac.addAction(SubmitAction)
        present(ac, animated: true)
    }
    
    func submit(_ item: String) {
//      inserting items in the array
        items.insert(item, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
//      insertinf items in the UITable view
        tableView.insertRows(at: [indexPath], with: .automatic)
        return
    }
    
}
