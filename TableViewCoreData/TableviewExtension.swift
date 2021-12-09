//
//  TableviewExtension.swift
//  TableViewCoreData
//
//  Created by Nathaniel Whittington on 12/8/21.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Uresponse = response[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ResponseTableViewCell
        cell.responseLabel?.text = Uresponse.yesResponse
        cell.dateLabel?.text = Uresponse.dateResponse?.convertToString() ?? ""
        
        return cell
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
       
        let item = response[indexPath.row]
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (_) in
            
            let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.yesResponse
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: {[weak self] (_) in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                    return
                }
                
                self?.updateItem(item: item, newResponse: newName, newDate: Date())
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self](_) in
            self?.deleteItems(item: item)
        }))
        
        present(sheet, animated: true, completion: nil)
        
       
        
    }
    
    

    func retrieveItems(){
        
        do{
           response = try context.fetch(UserResponse.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch let error{
            print("The error is \(error.localizedDescription)")
        }
    }
}



