//
//  ViewController.swift
//  tableView
//
//  Created by miyazawaryohei on 2020/08/17.
//  Copyright © 2020 miya. All rights reserved.
//

import UIKit


struct Fruit {
    let name: String
    let isChecked: Bool
}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet private var tableView: UITableView!
    private var fruitItems :[Dictionary<String, Any>] = []
    
    private let KeyName = "Name"
    private let KeyCheck = "Check"
    
    //fruitItemsを初期化
        private var fruitItems: [Fruit] = [
        Fruit(name:"りんご", isChecked: false),
        Fruit(name:"みかん", isChecked: true),
        Fruit(name:"バナナ", isChecked: false),
        Fruit(name:"パイナップル", isChecked: true)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //1行の場合、returnは省略可能
        1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.fruitItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let fruitItem = self.fruitItems[indexPath.row]
        cell.cellImage.image = nil
        
        if fruitItem.isChecked {
            cell.cellImage.image = UIImage(named: "checkmark")
        } else {
            cell.cellImage.image = nil
        }
        
        cell.label.text = (fruitItem[KeyName] as? String) ?? ""
        
        return cell
    }
    
    
    @IBAction func exitCancell(segue:UIStoryboardSegue){
    }
    
    
    @IBAction func exitSave(segue:UIStoryboardSegue){
        //定数の先頭は小文字
        let addVC = segue.source as! AddViewController
        let addText = addVC.addTextField.text
        
        //if let で！を避ける
        if let addText = addVC.addTextField.text {
            fruitItems.append(Fruit(name:addText, isChecked:false))
        }
        tableView.reloadData()
    }
    
}

