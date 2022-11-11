//
//  BetgeViewController.swift
//  GreenSpace
//
//  Created by 최진용 on 2022/11/10.
//

import UIKit

class BetgeViewController: UIViewController{
    
    @IBOutlet weak var betgeCollectionView: UICollectionView!
    @IBOutlet weak var betgeBackgroundView: UIView!
    
    @IBOutlet weak var backgroundContainerView: UIView!
    
    
    
    /// 시작 constraint 를 top을 buttom과 동일하게 하는걸로, 시작할때 밑에서 올라오도록 하기 위한 세팅

    
    override func viewDidLoad() {
        super.viewDidLoad()
        betgeCollectionView.delegate = self
        betgeCollectionView.dataSource = self
 
    }
    
}

//MARK: -collectionView delegate
extension BetgeViewController: UICollectionViewDelegate{
    
}

//MARK: - collectionView datasource
extension BetgeViewController: UICollectionViewDataSource{
    
    
    /// 목업데이터 넣어줘야함.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    ///return cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BetgeCollectionViewCell.self), for: indexPath) as! BetgeCollectionViewCell
        
        return cell
    }
    
}

//MARK: -CollectinoViewCompositional Layout
extension BetgeViewController{
    
    
}


