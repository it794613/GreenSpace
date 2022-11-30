//
//  StoreCollectionViewCell.swift
//  StoreView
//
//  Created by 최진용 on 2022/11/26.
//

import UIKit

class BuyItemCell: UICollectionViewCell{
    

    
    @IBOutlet weak var buyItemButton: UIButton!
    
    var buyItemPressed: (()->()) = {}
    
    
    var imageName = ""
    @IBOutlet weak var imageView: UIImageView!
    
    func fetchData(_ data: BaseItems){
        if let data = data as? BuyItems {
            imageName = data.imageName
            self.imageView.image = UIImage(named: imageName)
        }
    }
    
    @IBAction func pressBuyButton(_ sender: UIButton) {
        buyItemPressed()
    }
    
    
    
}
