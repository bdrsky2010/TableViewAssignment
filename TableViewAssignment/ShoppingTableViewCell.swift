//
//  ShoppingTableViewCell.swift
//  TableViewAssignment
//
//  Created by Minjae Kim on 5/23/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configUI()
    }
    
    private func configUI() {
        configCellView()
        configCheckButton()
        configTitleLabel()
        configStarButton()
    }
    
    private func configCellView() {
        self.cellView.backgroundColor = .systemGray6
        self.cellView.layer.cornerRadius = 10
    }
    
    private func configCheckButton() {
        self.checkButton.tintColor = .systemIndigo
    }
    
    private func configTitleLabel() {
        self.titleLabel.font = .systemFont(ofSize: 13, weight: .bold)
        self.tintColor = .label
    }
    
    private func configStarButton() {
        self.starButton.tintColor = .systemYellow
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
