//
//  ProductViewController.swift
//  GreenSpace
//
//  Created by 조나영 on 2022/11/16.
//

import UIKit

class ProductViewController: UIViewController{

    @IBOutlet weak var toggleControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var ProductTable: UITableView!
    var toggleIndex = 0
    
    var dataArray: Array<String> = ["Product1","Product2","Product3"]
    var AllNames: Array<String> = ["Product1","Product2","Product3"]
    
    //NoBookmark 배열
    var Bookmark: Array<String> = [String]()
    //Bookmark 배열
    var Names: Array<String> = [String]()
    
    lazy var BookmarkIndex: [Int:Int] = [:]
    lazy var noBookmarkIndex: [Int:Int] = [:]
    
    //토글버튼
    @IBAction func toggleBtn(_ sender: UISegmentedControl) {
        switch toggleControl.selectedSegmentIndex{
                case 0://NoBookmark
                    toggleIndex = 0
                    dataArray.removeAll()
                    for str in AllNames{
                        dataArray.append(str)
                    }
                    viewDidLoad()
                case 1: //Bookmark
                    toggleIndex = 1
                    dataArray.removeAll()
                    for str in Bookmark{
                        dataArray.append(str)
                    }
                    viewDidLoad()
                default:
                    break;
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Names=dataArray
        
        ProductTable.tableFooterView=UIView(frame : .zero)
        ProductTable.register(UINib(nibName:"ProductTableCell",bundle: nil), forCellReuseIdentifier: "ProductTableCell")
        
        ProductTable.dataSource = self
        ProductTable.delegate = self
        textField.delegate = self
        
        ProductTable.reloadData()
        
    }

    //검색
    @IBAction func searchProduct(_ sender: UITextField) {
        if let searchText = sender.text{
            Names=searchText.isEmpty ? dataArray: dataArray.filter{$0.lowercased().contains(searchText.lowercased())}
            ProductTable.reloadData()
        }
        
    }
    
    
}
//검색기능
extension ProductViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
}

extension ProductViewController: UITableViewDataSource, ProductCellDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Names.count
    }
    
    func pressBookMark(for index: Int, press:Bool){
        if press{
            if(toggleIndex == 0){
                if AllNames.count == 0 {
                    return
                }
                Bookmark.append(dataArray[index])
                AllNames.remove(at: index)
                Names.remove(at: index)
            }
            
            
            noBookmarkIndex[index]=1
            BookmarkIndex[index]=0
        }
        else{
            if (toggleIndex==1){
                AllNames.append(dataArray[index])
                Bookmark.remove(at: index)
                Names.remove(at: index)

            }
            
            BookmarkIndex[index]=0
            noBookmarkIndex[index]=1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Productcell=tableView.dequeueReusableCell(withIdentifier: "ProductTableCell") as! ProductTableCell
        
        Productcell.setProductName(Names[indexPath.row])
        //        Productcell.bookMark = network 가져온데이터를넣어준다.
        Productcell.delegate=self
        Productcell.index = indexPath.row
        if toggleIndex==0{
            if BookmarkIndex[indexPath.row]==1{
                Productcell.isTouched=true
            }
            else{
                Productcell.isTouched=false
            }
        }
        else{
            if noBookmarkIndex[indexPath.row]==1{
                Productcell.isTouched=true
            }
            else{
                Productcell.isTouched=false
            }
        }
        return Productcell
    }
}

extension ProductViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
