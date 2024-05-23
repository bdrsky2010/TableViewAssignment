//
//  ShoppingTextFieldTableViewCell.swift
//  TableViewAssignment
//
//  Created by Minjae Kim on 5/23/24.
//

import UIKit

class ShoppingTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var textFieldCoverView: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    private func configUI() {
        configCoverView()
        configTextField()
        configPlusButton()
    }
    
    private func configCoverView() {
        self.textFieldCoverView.backgroundColor = .lightGray
        self.textFieldCoverView.layer.cornerRadius = 10
    }
    
    private func configTextField() {
        self.userTextField.placeholder = "무엇을 구매하실 건가요?"
        self.userTextField.font = .systemFont(ofSize: 13, weight: .bold)
        self.userTextField.borderStyle = .none
    }
    
    private func configPlusButton() {
        self.plusButton.setTitle("추가", for: .normal)
        self.plusButton.setTitleColor(.label, for: .normal)
        self.plusButton.backgroundColor = .darkGray
        self.plusButton.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
