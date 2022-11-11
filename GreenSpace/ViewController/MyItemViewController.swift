//
//  MyItemViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/10.
//

import UIKit
import PanModal

class MyItemCollectionViewController: UICollectionViewController{

    
    override func viewDidLoad(){
        super.viewDidLoad()
        let cellIdentifier = String(describing: MyItemCollectionViewCell.self)
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        
        
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyItemCollectionViewCell.self), for: indexPath)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    
}

//MARK: - panmodal 처리
extension MyItemCollectionViewController: PanModalPresentable{
    var panScrollable: UIScrollView?{
        return self.collectionView
    }
    var shortFormHeight: PanModalHeight{
        return .contentHeight(300)
    }
    var longFormHeight: PanModalHeight{
        return .maxHeightWithTopInset(40)
    }
}

//MARK: -contraintLayout
extension MyItemCollectionViewController{
    func createLayou(){
        
    }
}
