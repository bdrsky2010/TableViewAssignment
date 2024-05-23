//
//  ShoppingTableViewController.swift
//  TableViewAssignment
//
//  Created by Minjae Kim on 5/23/24.
//

import UIKit

struct Shopping {
    let title: String
    var check: Bool
    var star: Bool
}

class ShoppingTableViewController: UITableViewController {
    
    private var shoppingList = [
        Shopping(title: "그립톡 구매하기", check: true, star: true),
        Shopping(title: "사이다 구매", check: false, star: false),
        Shopping(title: "아이패드 케이스 최저가 알아보기", check: false, star: true),
        Shopping(title: "양말", check: false, star: true)
    ]
    
    private var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "쇼핑"
        view.backgroundColor = .systemBackground
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shoppingList.count + 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        } else {
            return 40
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textField", for: indexPath) as! ShoppingTextFieldTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! ShoppingTableViewCell
            
            let index = indexPath.row - 1
            
            let checkImageName = shoppingList[index].check ? "checkmark.square.fill" : "checkmark.square"
            let starImageName = shoppingList[index].star ? "star.fill" : "star"
            
            let checkImage = UIImage(systemName: checkImageName)
            let starImage = UIImage(systemName: starImageName)
            
            cell.titleLabel.text = shoppingList[index].title
            cell.checkButton.setImage(checkImage, for: .normal)
            cell.starButton.setImage(starImage, for: .normal)
            
            return cell
        }
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        print(#function)
        guard let text = sender.text else { return }
        self.text = text
    }
    
    @IBAction func plusButtonClicked(_ sender: UIButton) {
        print(#function)
        if !text.isEmpty {
            self.shoppingList.append(Shopping(title: text, check: false, star: false))
            tableView.reloadData()
        }
    }
    
    
}
