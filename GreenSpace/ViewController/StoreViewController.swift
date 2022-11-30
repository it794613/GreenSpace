//
//  ViewController.swift
//  StoreView
//
//  Created by 최진용 on 2022/11/26.
//

/*TODO: -

2. supplementary view.
3. 레이아웃 고치가
*/
import UIKit

class StoreViewController: UIViewController {
    
    //목업데이터
    var tempSellArray: [SellItems] = [SellItems(imageName: "testimage"),SellItems(imageName: "testimage"),SellItems(imageName: "testimage"),SellItems(imageName: "testimage")]
    var tempBuyArray: [BuyItems] = [BuyItems(imageName: "testimage"),BuyItems(imageName: "testimage"),BuyItems(imageName: "testimage")]

    
    
    func showQuestionAlarm(alarm: String) {
        let alert = UIAlertController(title: "확인", message: "\(alarm) 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAlert = UIAlertAction(title: "네", style: UIAlertAction.Style.default) { okAlert in
            print("hi")
        }
        let noAlert = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default)
        alert.addAction(okAlert)
        alert.addAction(noAlert)
        self.present(alert, animated: false)
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let buyItemNib = UINib(nibName: String(describing: BuyItemCell.self), bundle: nil)
        self.collectionView.register(buyItemNib, forCellWithReuseIdentifier: String(describing: BuyItemCell.self))
        
        let sellItemNib = UINib(nibName: String(describing: SellItemCell.self), bundle: nil)
        self.collectionView.register(sellItemNib, forCellWithReuseIdentifier: String(describing: SellItemCell.self))
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        GlobalItems.shared.array.append(tempSellArray)
        GlobalItems.shared.array.append(tempBuyArray)
        collectionView.collectionViewLayout = creatLayout()
    }


}


//MARK: - collectionview delegate, datasource
extension StoreViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    //셀 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = GlobalItems.shared.array[indexPath.section][indexPath.item]
        let sectionIDX = indexPath.section
        switch sectionIDX{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SellItemCell", for: indexPath) as! SellItemCell
            let cellIDX = indexPath.row
            cell.fetchData(cellData)
            cell.sellItemPressed = {
                let alert = UIAlertController(title: "확인", message: "판매 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
                let okAlert = UIAlertAction(title: "네", style: UIAlertAction.Style.default) { okAlert in
                    let tempItem = self.tempSellArray[indexPath.row] as BaseItems
                    GlobalItems.shared.array[1].append(tempItem)
                    GlobalItems.shared.array[0].remove(at: cellIDX)
                    collectionView.reloadData()
                }
                let noAlert = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default)
                alert.addAction(okAlert)
                alert.addAction(noAlert)
                self.present(alert, animated: false)
            }
           
            
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuyItemCell", for: indexPath) as! BuyItemCell
            let cellIDX = indexPath.row
            cell.fetchData(cellData)
            cell.buyItemPressed = {
                let alert = UIAlertController(title: "확인", message: "구매 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
                let okAlert = UIAlertAction(title: "네", style: UIAlertAction.Style.default) { okAlert in
                    let tempItem = self.tempBuyArray[indexPath.row] as BaseItems
                    GlobalItems.shared.array[0].append(tempItem)
                    GlobalItems.shared.array[1].remove(at: cellIDX)
                    collectionView.reloadData()
                }
                let noAlert = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default)
                alert.addAction(okAlert)
                alert.addAction(noAlert)
                self.present(alert, animated: false)
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    //섹션별 아이탬 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GlobalItems.shared.array[section].count
    }
    
    //섹션갯수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return GlobalItems.shared.array.count
    }
    
    
    
}




//MARK: - compositional layout
extension StoreViewController {
    
    func creatLayout()->UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout{
            // 만들게 되면 튜플 (키: 값, 키: 값) 의 묶음으로 들어옴 반환 하는 것은 NSCollectionLayoutSection 콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex: Int, layoutEnvironment : NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템에 대한 사이즈 - absolute 는 고정값, estimated 는 추축, fraction 퍼센트
            if sectionIndex == 0{
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(150))
                
                // 위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // 아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                // 그룹사이즈
                let grouSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15)) // 한 줄 짜리
                
                // 그룹사이즈로 그룹 만들기
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: grouSize, subitems: [item, item, item,item])
                
                // 그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: group)
                //section.orthogonalScrollingBehavior = .continuous // 오른쪽으로 스크롤이 가능
                
                // 섹션에 대한 간격
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 40, trailing: 30)
                
                return section
                
            } else{
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(150))
                
                // 위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // 아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                // 그룹사이즈
                let grouSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.15)) // 한 줄 짜리
                
                // 그룹사이즈로 그룹 만들기
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: grouSize, subitems: [item, item, item,item])
                
                // 그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: group)
                // section.orthogonalScrollingBehavior = .continuous // 오른쪽으로 스크롤이 가능
                
                
                // 섹션에 대한 간격
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 30)
                
                return section
            }
        }
        return layout
    }
}
