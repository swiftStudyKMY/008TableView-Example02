//
//  ListViewController.swift
//  008TableView-Example02
//
//  Created by 김민영 on 11/25/19.
//  Copyright © 2019 김민영. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    var list = [String]()
    
    //MARK:UIAlertController
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: " 목록입력", message: "추가될 글을 작성해주세요.", preferredStyle: .alert)
        
        alert.addTextField(){(tf) in
            tf.placeholder = "내용을 입력하세요."
        }
        
        let ok = UIAlertAction(title: "OK", style: .default){(_) in
            
            if let title = alert.textFields?[0].text{
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: false)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //estimatedRowHeight
        //셀 전체의 높이를 결정하기 전에 임시로 사용할 셀의 높이값 세팅
        self.tableView.estimatedRowHeight = 50
        
        //automaticDimension
        //테이블 뷰의 rowHeight 속성을 대입하여 높이값이 동적으로 설정됨을 테이블 뷰에 알려주는 역할.
        //rowHeight 속성이 설정 되면 전체 목록이 만들어진 시점에서 셀 내부의 콘텐츠 레이아웃을 계산하고 그에 따라 셀마다 높이값을 재설정함.
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    //MARK:numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    //MARK:cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //1. "cell" 을 찾아 읽는다.
        //2. 없으면 UITableViewCell 생성한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
        
    }
    
//    //MARK:estimatedHeightForRowAt
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = self.list[indexPath.row]
//
//        //높이 조절
//        //기본 높이 60, 글의 길이가 30자 넘을 경우 (* 20)
//        let height = CGFloat(60 + (row.count/30) * 20)
//
//        return height
//    }
}
