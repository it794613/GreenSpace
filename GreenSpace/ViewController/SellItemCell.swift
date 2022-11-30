//
//  SellItemCell.swift
//  StoreView
//
//  Created by 최진용 on 2022/11/26.
//

import UIKit

class SellItemCell: UICollectionViewCell{
    
    @IBOutlet weak var SellItemButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var imageName = ""
    
    var sellItemPressed : (()->()) = {}
    
    
    func fetchData(_ data: BaseItems){
        if let data = data as? SellItems {
            imageName = data.imageName
            self.imageView.image = UIImage(named: imageName)
        }
    }
    
    @IBAction func pressSellButton(_ sender: UIButton) {
        sellItemPressed()
    }
}
