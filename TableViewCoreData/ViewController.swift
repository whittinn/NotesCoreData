//
//  ViewController.swift
//  TableViewCoreData
//
//  Created by Nathaniel Whittington on 12/8/21.
//

import UIKit

class ViewController: UIViewController {

    

     var response = [UserResponse]()
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveItems()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func addDataButtonTappepd(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self] (_) in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
            self?.createItem(response: text)
            
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    func createItem(response:String){
        
        let newName = UserResponse(context: context)
        newName.yesResponse = response
        newName.dateResponse = Date()
        
        do{
            try context.save()
            retrieveItems()
            
            
        }catch let error{
            
            print("Could not retrieve \(error.localizedDescription)")
        }
    
    }
    
    func deleteItems(item: UserResponse){
        
        context.delete(item)
        
        do{
            
            try context.save()
            retrieveItems()
            
        }catch let error{
            
            print("The error is \(error.localizedDescription)")
        }
    }
    
    func updateItem(item: UserResponse, newResponse: String, newDate: Date){
        
        item.yesResponse = newResponse
        item.dateResponse = newDate
        
        do{
            try context.save()
            retrieveItems()
        }catch let error {
            
            print("The error is \(error.localizedDescription)")
        }
        
        
    }
    
}

