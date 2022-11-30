//
//  BetgeCollectionViewCell.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/10.
//

import UIKit

class BetgeCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var betgeImageView: UIImageView!
    
    var selectBetge: (()->())={}
    var imageName = ""
   
    @IBAction func pressSelectBetge(_ sender: UIButton) {
        selectBetge()
    }
}
