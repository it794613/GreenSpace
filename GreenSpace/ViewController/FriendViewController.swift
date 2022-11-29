import UIKit

class FriendViewController: UIViewController {
    
    
    @IBOutlet weak var friendTextField: UITextField!
    @IBOutlet weak var FriendTable:UITableView!
    @IBOutlet weak var toggleControl: UISegmentedControl!
    
    var toggleIndex=0
    var dataArray: Array<String> = ["hi", "hello","bye","qq"]//초기값 저장해놓고 토글 바꼈을 시 저장되는 배열으로 사용
    var AllNames: Array<String> = ["hi", "hello","bye","qq"]//모든 친구
    var Follows: Array<String> = ["you", "i","me"]//팔로우
    
    var Names:Array<String> = []
    lazy var FriendIndex: [Int:Int] = [:]
    
    //toggle 버튼
    @IBAction func toggleBtn(_ sender: Any) {
        switch toggleControl.selectedSegmentIndex
            {
            //AllMember일 때
            case 0:
            print("클릭")
                toggleIndex=0
                dataArray.removeAll()
                for str in AllNames{
                    dataArray.append(str)
                }
                viewDidLoad()
            //Follow일 때
            case 1:
            print("zx")
                toggleIndex=1
                dataArray.removeAll()
                for str in Follows{
                    dataArray.append(str)
                }
                viewDidLoad()
            default:
                break
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Names=dataArray
        
        FriendTable.tableFooterView=UIView(frame : .zero)
        FriendTable.register(UINib(nibName:"FriendTableCell",bundle: nil), forCellReuseIdentifier: "FriendTableCell")
        FriendTable.dataSource = self
        FriendTable.delegate = self
        friendTextField.delegate = self
        FriendTable.reloadData()
        
    }
    //검색
    @IBAction func search(_ sender: UITextField) {
        if let searchText=sender.text{
            Names=searchText.isEmpty ? dataArray: dataArray.filter{$0.lowercased().contains(searchText.lowercased())}
            FriendTable.reloadData()
        }
    }
   
}

//Friend Table View DataSource
extension FriendViewController: UITableViewDataSource,UITableViewDelegate, FriendCellDelegate{
    
    //버튼 클릭시 이벤트
    func followPressBtn(for index: Int, press: Bool) {
       
        if press{
            //팔로우 버튼 클릭시
            if toggleIndex==1{
                AllNames.append(Names[index])
                Follows.remove(at: index)
                Names.remove(at: index)
                dataArray.remove(at: index)
                let alert = UIAlertController(title: "성공", message: "팔로우 완료!", preferredStyle: UIAlertController.Style.alert)
                let Good = UIAlertAction(title: "Good", style: .default, handler: nil)
                alert.addAction(Good)
                self.present(alert, animated: true)
                
            }
            viewDidLoad()
            FriendIndex[index] = 1
        }else{
            FriendIndex[index] = 0
        }
        
    }
   
    
    //row 개수 설정
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return Names.count//배열 크기 변환
    }
    //높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //각 row에 나타낼 cell 정하기 + 버튼 클릭시 이벤트
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Friendcell=tableView.dequeueReusableCell(withIdentifier: "FriendTableCell") as! FriendTableCell
        Friendcell.setFriendName(Names[indexPath.row])
        Friendcell.delegate = self
        Friendcell.index = indexPath.row
        
        //btn 타이틀 정하기
        if(toggleIndex==0){
            Friendcell.setBtnTitle("프로필 보기")
        }else{
            Friendcell.setBtnTitle("follow")
        }
        
        //cell 클릭 안되도록
        Friendcell.selectionStyle = .none
        
        
        return Friendcell
    }
    
    //스와이프 삭제 버튼(toggle위치 0일때 작동, 1일때는 작동 x)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //0일때 스와이프 작동
        if toggleIndex == 0 {
            //삭제 이름 Delete로 설정
            let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
                    self.Follows.append(self.Names[indexPath.row])
                    self.AllNames.remove(at: indexPath.row)
                    self.Names.remove(at: indexPath.row)
                    self.dataArray.remove(at: indexPath.row)
                    self.FriendTable.deleteRows(at: [indexPath], with: .fade)
                    self.FriendTable.endUpdates()
                   }
            //삭제 버튼 넣기
            let swipeAction = UISwipeActionsConfiguration(actions: [delete])
            //삭제 버튼 길게 늘어나기
            swipeAction.performsFirstActionWithFullSwipe = true
            return swipeAction
            //toggle 1일때 스와이프 작동 x
        } else {
            let config = UISwipeActionsConfiguration()
            //스와이프 작동 false
            config.performsFirstActionWithFullSwipe = false
            return config
        }
    }
}
//키보드 return시 키패드 닫기
extension FriendViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        friendTextField.endEditing(true)
    }
}

