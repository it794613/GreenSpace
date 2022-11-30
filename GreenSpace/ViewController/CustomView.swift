//
//  CustomView.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/16.
//

import UIKit

@IBDesignable
class CustomView: UIView{
    
    
    @IBInspectable
    var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
