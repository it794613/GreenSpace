//
//  PostingCustomCollectionViewCell.swift
//  Post
//
//  Created by 황수비 on 2022/11/23.
//


import Foundation
import UIKit
class PostingCustomCollectionViewCell:  UICollectionViewCell {
    
    //닙파일에 image는 weak가 아니라 strong으로 설정해주어야 한다.
    
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var deleteButton: UIButton!
    var imageName : String = "" {
        didSet{
            print("PostingCustomCollectionViewCell / imageName - didSet() : \(imageName)")
            // 쏄의 UI 설정
            self.postImage.image = UIImage(systemName: imageName)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("PostingCustomCollectionViewCell - awakeFromNib() called")
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.postImage.layer.cornerRadius = postImage.frame.height
        
//        deleteButton.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)


    }
    
//    @objc fileprivate func deleteButtonClicked(){
//        print("PostingViewController - deleteButtonClicked")
//
//        self.deleteItems(at: [IndexPath.init(row: sender.tag, section: 0)])
//
//        GlobalPosting.shared.postingImageArray.remove(at: <#Int#>)
//
//    }
//
        
        
        //사진 삭제
//        picker.didFinishPicking { [unowned picker] items, cancelled in
//            if cancelled {
//                print("Picker was canceled")
//            }
//            picker.dismiss(animated: true, completion: nil)
//        }
    

}


 

