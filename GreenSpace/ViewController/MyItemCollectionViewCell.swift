//
//  MyItemCollectionViewCell.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/11.
//

import UIKit

class MyItemCollectionViewCell: UICollectionViewCell{
    
    //delete button에 작동할 closure
    var delete: (()->()) = {}
    
    
    @IBAction func pressDelete(_ sender: UIButton) {
        delete()
    }
    
    @IBOutlet weak var myItemImageView: UIImageView!
    
    
}
