//
//  ExampleTableViewController.swift
//  Dynamic Controls Example App
//
//  Created by Joseph Duffy on 11/03/2015.
//  Copyright (c) 2015 Yetii Ltd. All rights reserved.
//

import UIKit

class ExampleTableViewController: DynamicTableViewController {

    private let StockDefaultCellSection = 0
    private let DynamicDefaultCellSection = 1
    private let CellWithSwitchSection = 2
    private let CellAsButtonSection = 3
    private let CellWithTextFieldSection = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerClass(UITableViewCell.self, forCellReuseIdentifier: "StockDefaultCell")
        self.registerClass(DynamicTableViewCell.self, forCellReuseIdentifier: "DynamicDefaultCell")
        self.registerClass(DynamicTableViewCellWithSwitch.self, forCellReuseIdentifier: "CellWithSwitch")
        self.registerClass(DynamicTableViewCellAsButton.self, forCellReuseIdentifier: "CellAsButton")
        self.registerClass(DynamicTableViewCellWithTextField.self, forCellReuseIdentifier: "CellWithTextField")
    }
    
    override func cellReuseIdentifierForIndexPath(indexPath: NSIndexPath) -> String? {
        switch indexPath.section {
        case self.StockDefaultCellSection:
            return "StockDefaultCell"
        case self.DynamicDefaultCellSection:
            return "DynamicDefaultCell"
        case self.CellWithSwitchSection:
            return "CellWithSwitch"
        case self.CellAsButtonSection:
            return "CellAsButton"
        case self.CellWithTextFieldSection:
            return "CellWithTextField"
        default:
            return nil
        }
    }
    
    override func configureCell(cell: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            // First rows have content, second don't
            cell.textLabel?.text = "Text Label"
            cell.detailTextLabel?.text = "Detail Text Label"
        }
        
        if indexPath.section == self.CellWithTextFieldSection {
            if let cell = cell as? DynamicTableViewCellWithTextField {
                cell.textField.delegate = self
            }
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case self.StockDefaultCellSection:
            return "Stock Default Cell"
        case self.DynamicDefaultCellSection:
            return "Dynamic Default Cell"
        case self.CellWithSwitchSection:
            return "Cell With UISwitch"
        case self.CellAsButtonSection:
            return "Cell As Button"
        case self.CellWithTextFieldSection:
            return "Cell With UITextField"
        default:
            return nil
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // All sections just have 2 example rows in it: one with content and one empty
        return 2
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

extension DynamicTableViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Dimsiss the text field when the return key is pressed
        textField.resignFirstResponder()
        
        return false
    }
}
