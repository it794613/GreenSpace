//
//  MyItemCollectionViewCell.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/11.
//

import UIKit

class MyItemCollectionViewCell: UICollectionViewCell{
    
    //delete button에 작동할 closure
    var selectItem: (()->()) = {}
    
    var imageName = ""
    
    @IBAction func pressSelectItemButton(_ sender: Any) {
            selectItem()
    }
    
    @IBOutlet weak var myItemImageView: UIImageView!
    
    
}
