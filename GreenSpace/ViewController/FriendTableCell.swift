
//
//  FriendTableCell.swift
//  GreenSpace
//
//  Created by 최희진 on 2022/11/16.
//

import UIKit


protocol FriendCellDelegate {
    func followPressBtn(for index: Int, press: Bool)
}
class FriendTableCell: UITableViewCell {
    var delegate: FriendCellDelegate?
    var index: Int?//cell의 index
    
    @IBOutlet weak var FriendActionBtn: UIButton!
    @IBOutlet weak var FriendName:UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    func setFriendName(_ name: String){
        self.FriendName.text=name;
    }
    func setBtnTitle(_ title: String){
        self.FriendActionBtn.setTitle(title, for: .normal)
    }
    //버튼 클릭시
    @IBAction func followPressBtn(_ sender: UIButton) {
            guard let idx = index else {return}
            if sender.isSelected {
                delegate?.followPressBtn(for: idx, press: true)
            }else {
                delegate?.followPressBtn(for: idx, press: false)
            }
            sender.isSelected = !sender.isSelected
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
