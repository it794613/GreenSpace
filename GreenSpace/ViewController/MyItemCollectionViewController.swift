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
        cell.imageName = "testimg"
        
        //딜리트 버튼이 눌렸을때 작동할 함수 넘겨주기
        cell.selectItem = {
            print("rows = \(indexPath.row)")
            GlobalImage.shared.myItemImageName = cell.imageName
        }
        
        
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
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
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
