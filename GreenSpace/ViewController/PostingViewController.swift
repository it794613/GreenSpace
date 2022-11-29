//
//  ViewController.swift
//  store
//
//  Created by 황수비 on 2022/11/09.
//

import UIKit
import YPImagePicker

// 전체 view
class PostingViewController : UIViewController{
    
    var uiImage : UIImage = UIImage(named: "testimg")!
    
    
    @IBOutlet var addButton: UIButton!
    
    
    @IBOutlet var PostingCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PostingViewController - viewDidLoad() called")
    
    //collection view에 대한 설정
    PostingCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    PostingCollectionView.dataSource=self
    PostingCollectionView.delegate=self
    
    //   ----닙파일이랑 연결----
    //닙파일 연결시켜주기
    let PostingCollectionViewCellNib = UINib(nibName: String(describing: PostingCustomCollectionViewCell.self), bundle: nil)
    
    //가져온 닙파일을 콜렉션뷰에 셀로 등록하기
    self.PostingCollectionView.register(PostingCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: PostingCustomCollectionViewCell.self))
                                        
    //콜렉션 뷰의 콜렉션 뷰 레이아웃 설정하기
    self.PostingCollectionView.collectionViewLayout = createCompositionalLayout()
        
    // ----닙파일이랑 연결----
        
        // addButton 클릭 액션 설정
        self.addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
    }
    
    //addButton이 클릭되었을 때
    @objc fileprivate func addButtonClicked(){
        print("PostingViewController - addButtonClicked")
        
        //카메라 라이브러리 세팅
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo]
        
        
        let picker = YPImagePicker(configuration: config)
        
        
        //사진이 선택되었을 때
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                //이미지를 변경한다.
                //let systemImageNameArray=photo.image
                self.uiImage = photo.image
                GlobalPosting.shared.postingImageArray.append(self.uiImage)
                self.PostingCollectionView.reloadData()
                
            }
            //피커 창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        //사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
        
    }
    
//    postAPI.signin(request: SigninRequest(nickname: id, password: password)) { succeed, failed in
//        if let result = succeed{
//            self.gotoHomeView()
//        }else{
//            self.returnWarning(message: "아이디와 패스워드를 다시 확인해주세요")
        //}
   // }
    
}


 
//----확장----
//코드 기니까 extension으로 빼둠
//MARK - CollectionView 콤포지셔널 레이아웃 관련
extension PostingViewController{
    
    //콤포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayout()-> UICollectionViewLayout{
        let layout =  UICollectionViewCompositionalLayout{
            (sectionIndex:Int, LayoutEnvironment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //--item에서 item이 묶여진 group, group에서 group들이 묶여진 section을 만드는 과정
            
            //아이템에 대한 사이즈 - absolute:고정 값, estimated:추측, fraction: 화면에서 퍼센트
            let itemsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
            
            //위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemsize)
            
            //아이템 간의 간격 설정
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading:2, bottom: 2, trailing: 2)
            
            //--group
            // 그룹사이즈
            let groupsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
            
            // group
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupsize, subitem: item, count: 2)
            
            //그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            
            //섹션 간격
            section.contentInsets=NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            //--item-group-section과정
            
            return section
        }
        return layout
    }

}

                                        
//collection view를 몇개 보여주고 각 섹션은 몇개인지 그런거 입력하는 것
//datasource는 프로토콜이 필수임
extension PostingViewController:UICollectionViewDataSource{
    
    //각 섹션에 들어가는 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //+Button 이 생기면 갯수를 하나씩 늘려가야 함
        return GlobalPosting.shared.postingImageArray.count
    }
    
    //각 collection view cell 에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cellid=String(describing: PostingCollectionViewCell.self)
//        print("cellid:\(cellid)")
       
        //닙 파일 안의 요소에 접근
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PostingCustomCollectionViewCell.self), for: indexPath) as! PostingCustomCollectionViewCell
    
        
        //image에 대한 설정
//        cell.postImage.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
        cell.postImage.image = GlobalPosting.shared.postingImageArray[indexPath.row]
        
        //deleteButton
        cell.deleteButton.tag=indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonClicked(sender:)), for: .touchUpInside)
        
        
        
        return cell
        
    }
    
    
}
//collection view 액션과 관련된 것들
extension PostingViewController:UICollectionViewDelegate{
    
}

extension PostingViewController
{
    @objc func deleteButtonClicked(sender : UIButton)
    {
        //컬랙션뷰 데이터를 먼저 삭제 후 데이터 배열의 값을 삭제
        PostingCollectionView.deleteItems(at: [IndexPath.init(row: sender.tag, section: 0)])
        GlobalPosting.shared.postingImageArray.remove(at: sender.tag)
        
    }
}



//----확장----


