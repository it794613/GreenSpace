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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
        
        
        ItemAPI.getBadge { succeed, failed in
            if let badgeArray = succeed{
                GlobalBadge.shared.array = badgeArray
            }
        }
        
    }
    
    
}

extension BetgeCollectionViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GlobalBadge.shared.array.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyItemCollectionViewCell.self), for: indexPath) as! BetgeCollectionViewCell
        let cellData = GlobalBadge.shared.array[indexPath.row]
        cell.betgeImageView.image = UIImage(named: cellData.image)
        cell.imageName = cellData.image
        
        //딜리트 버튼이 눌렸을때 작동할 함수 넘겨주기
        cell.selectBetge = {
            print("rows = \(indexPath.row)")
            GlobalImage.shared.betgeImageName = cell.imageName
        }
        
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
