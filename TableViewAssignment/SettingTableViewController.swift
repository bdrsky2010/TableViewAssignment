//
//  SettingTableViewController.swift
//  TableViewAssignment
//
//  Created by Minjae Kim on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {

    private let headerList = ["전체 설정", "개인 설정", "기타"]
    private let cellTitleList = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = ""
        navigationItem.title = "설정"
        
    }

    // header 갯수 파악
    override func numberOfSections(in tableView: UITableView) -> Int {
        headerList.count
    }
    
    // section 번호에 맞는 header 세팅
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerList[section]
    }
    
    // 셀 갯수 파악
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitleList[section].count
    }
    
    
    // 셀 모양 세팅
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "setting")
        cell.textLabel?.text = cellTitleList[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        
        return cell
    }
    
}
