//
//  BetgeCollectionViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/11.
//

import UIKit
import PanModal

class BetgeCollectionViewController: UICollectionViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellIdentifier = String(describing: BetgeCollectionViewCell.self)
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    
}

extension BetgeCollectionViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BetgeCollectionViewCell.self), for: indexPath)
        return cell
    }
}

//MARK: - panModal부분 처리
extension BetgeCollectionViewController: PanModalPresentable{
    var panScrollable: UIScrollView?{
        return collectionView
    }
    var shortFormHeight: PanModalHeight{
        return .contentHeight(300)
    }
    var longFormHeight: PanModalHeight{
        return .maxHeightWithTopInset(40)
    }
}

//MARK: - constraintLayout
extension BetgeCollectionViewController{
    func createLayout(){
        
    }
}
