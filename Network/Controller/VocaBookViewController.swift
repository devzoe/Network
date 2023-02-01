//
//  VocaBookViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/23.
//

import UIKit

class VocaBookViewController: UIViewController {
    let wordID = "WordTableViewCell"
    let vocaBookService : VocaBookService = VocaBookService.shared
    @IBOutlet weak var vocaBookTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        print(vocaBookService.readAll())
        setupVocaBookTableView()
        vocaBookTableView.reloadData()
        
    }

    private func setupVocaBookTableView() {
        // 1 셀 등록하기
        vocaBookTableView.register(
            UINib(nibName: wordID, bundle: nil),
            forCellReuseIdentifier: wordID
        )
        
        // 2 Delegate
        vocaBookTableView.delegate = self
        vocaBookTableView.dataSource = self
    }

}

extension VocaBookViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocaBookService.count
    }
    
    // UI
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 구성
        let cell = vocaBookTableView.dequeueReusableCell(
            withIdentifier: wordID,
            for: indexPath) as! WordTableViewCell
        
        // 데이터 전달 - 읽기 Read
        let cellData = vocaBookService.read(at: indexPath.row)
        cell.getVocaBook(data: cellData)
        
        // UI + 데이터
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  (vocaBookTableView.bounds.height) * 0.25
    }
}



