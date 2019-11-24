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
    
}
