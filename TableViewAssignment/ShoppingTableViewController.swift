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
        tableView.keyboardDismissMode = .onDrag
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // footer height 값 줄이기
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        
        return 40
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textField", for: indexPath) as! ShoppingTextFieldTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! ShoppingTableViewCell
        
        let index = indexPath.row
        
        let checkImageName = shoppingList[index].check ? "checkmark.square.fill" : "checkmark.square"
        let starImageName = shoppingList[index].star ? "star.fill" : "star"
        
        let checkImage = UIImage(systemName: checkImageName)
        let starImage = UIImage(systemName: starImageName)
        
        let checkButtonAction = UIAction { [weak self] _ in
            guard let self else { return }
            shoppingList[index].check.toggle()
            
            let checkImageName = shoppingList[index].check ? "checkmark.square.fill" : "checkmark.square"
            let checkImage = UIImage(systemName: checkImageName)
            cell.checkButton.setImage(checkImage, for: .normal)
        }
        
        let starButtonAction = UIAction { [weak self] _ in
            guard let self else { return }
            shoppingList[index].star.toggle()
            
            let starImageName = shoppingList[index].star ? "star.fill" : "star"
            let starImage = UIImage(systemName: starImageName)
            cell.starButton.setImage(starImage, for: .normal)
        }
        
        cell.titleLabel.text = shoppingList[index].title
        cell.checkButton.setImage(checkImage, for: .normal)
        cell.checkButton.tag = index
        cell.checkButton.addAction(checkButtonAction, for: .touchUpInside)
        
        cell.starButton.setImage(starImage, for: .normal)
        cell.starButton.tag = index
        cell.starButton.addAction(starButtonAction, for: .touchUpInside)
        
        return cell
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        self.text = text
    }
    
    @IBAction func plusButtonClicked(_ sender: UIButton) {
        if !text.isEmpty {
            self.shoppingList.append(Shopping(title: text, check: false, star: false))
            tableView.reloadData()
        }
    }
    
    
}
