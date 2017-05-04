//
//  ViewController.swift
//  Shamy
//
//  Created by Shamy Mash on 2/14/1396 AP.
//  Copyright © 1396 AP Shamy Mash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "فهرست"
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
    }

  
    @IBAction func addName(_ sender: Any) {
        
        let alert = UIAlertController(title: "نام جدید",
                                      message: "یک اسم جدید وارد نمایید",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "ذخیره",
                                       style: .default) {
                                        [unowned self] action in
                                        
                                        guard let textField = alert.textFields?.first,
                                            let nameToSave = textField.text else {
                                                return
                                        }
                                        
                                        self.names.append(nameToSave)
                                        self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "پشیمان",
                                         style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }


}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let cell =
                tableView.dequeueReusableCell(withIdentifier: "Cell",
                                              for: indexPath)
            cell.textLabel?.text = names[indexPath.row]
            return cell
    }
}
