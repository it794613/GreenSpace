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
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.collectionViewLayout = createLayout()
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyItemCollectionViewCell.self), for: indexPath) as! MyItemCollectionViewCell
        
        cell.myItemImageView.image = UIImage(named: "testimg")
        
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
    func createLayout()->UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{
            (sectionNumber: Int, env: NSCollectionLayoutEnvironment)->NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(0.7))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 3, bottom: 0, trailing: 3)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/4))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        return layout
    }
}
