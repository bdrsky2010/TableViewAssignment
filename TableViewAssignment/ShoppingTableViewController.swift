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
    
    // trailing swipe action
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkAction = UIContextualAction(style: .normal, title: "Star") { [weak self] _, _, success in
            guard let self else {
                success(false)
                return
            }
            
            shoppingList[indexPath.row].check.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            success(true)
        }
        checkAction.image = UIImage(systemName: "checkmark.square.fill")
        checkAction.backgroundColor = .systemIndigo
        
        return UISwipeActionsConfiguration(actions: [checkAction])
    }
    
    // leading swipe action
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let starAction = UIContextualAction(style: .normal, title: "Star") { [weak self] _, _, success in
            guard let self else {
                success(false)
                return
            }
            
            shoppingList[indexPath.row].star.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            success(true)
        }
        starAction.image = UIImage(systemName: "star.fill")
        starAction.backgroundColor = .systemYellow
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, success in
            guard let self else {
                success(false)
                return
            }
            
            shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            success(true)
        }
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [starAction, deleteAction])
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // footer height 값 줄이기
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        CGFloat.leastNormalMagnitude
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 50 : 40
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textField", for: indexPath) as! ShoppingTextFieldTableViewCell
            
            cell.plusButton.addTarget(self, action: #selector(plusButtonClicked), for: .touchUpInside)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! ShoppingTableViewCell
        
        let index = indexPath.row
        
        let checkImageName = shoppingList[index].check ? "checkmark.square.fill" : "checkmark.square"
        let starImageName = shoppingList[index].star ? "star.fill" : "star"
        
        let checkImage = UIImage(systemName: checkImageName)
        let starImage = UIImage(systemName: starImageName)
        
        cell.titleLabel.text = shoppingList[index].title
        cell.checkButton.setImage(checkImage, for: .normal)
        cell.checkButton.tag = index
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
        cell.starButton.setImage(starImage, for: .normal)
        cell.starButton.tag = index
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc
    private func plusButtonClicked(sender: UIButton) {
        // 타입캐스팅을 통해 텍스트필드 갖고 있는 셀 가져오기
        let cell = tableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! ShoppingTextFieldTableViewCell
        let textField = cell.userTextField
        
        guard let text = textField?.text , text.count > 1 else { return } // 입력된 text의 글자 수가 1보다 클 경우에만 아래코드 작동
        
        shoppingList.append(Shopping(title: text, check: false, star: false)) // 구조체 배열에 초기 데이터 추가
        tableView.reloadData() // 테이블뷰 다시 불러오기
        
        textField?.text = ""
        
        view.endEditing(true)
    }
    
    @objc
    private func checkButtonClicked(sender: UIButton) {
        let index = sender.tag
        shoppingList[index].check.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 1)], with: .automatic)
    }
    
    @objc
    private func starButtonClicked(sender: UIButton) {
        let index = sender.tag
        shoppingList[index].star.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 1)], with: .automatic)
    }
}
