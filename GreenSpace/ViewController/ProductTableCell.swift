//
//  ProductTableCell.swift
//  GreenSpace
//
//  Created by 조나영 on 2022/11/16.
//

import UIKit


protocol ProductCellDelegate{
    func pressBookMark(for index:Int, press:Bool)
}

class ProductTableCell: UITableViewCell {

    var delegate:ProductCellDelegate?
    var index:Int?
    
    
    @IBOutlet weak var ProductName: UILabel!
    
    @IBOutlet weak var bookMark: UIButton!
    
    var selectBookMark : (()->()) = {}
    var bookMarkCheck : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setProductName(_ name: String){
        self.ProductName.text = name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressBookMark(_ sender: UIButton) {
        
        guard let idx = index else{return}
        
        if sender.isSelected{
            isTouched = true
            delegate?.pressBookMark(for:idx,press: true)
            
        }else{
            isTouched = false
            delegate?.pressBookMark(for: idx, press: false)
        }
        sender.isSelected = !sender.isSelected
    }
    
    var isTouched:Bool?{
       
        didSet{
            if isTouched == true{
                print("zkd")
                bookMark.setImage(UIImage(named: "true"), for: .normal)
            }
            else{
                bookMark.setImage(UIImage(named: "false"), for: .normal)
            }
        }
    }
    
}
