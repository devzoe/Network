//
//  YouTubeViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/24.
//

import UIKit

class VideoViewController: UIViewController {
    let videoID = "VideoTableViewCell"
    let videoService : VideoService = VideoService.shared
    @IBOutlet weak var youTubeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
       
        setupYouTubeTableView()
        youTubeTableView.reloadData()
        self.navigationController?.navigationBar.topItem?.title = ""
    }

    private func setupYouTubeTableView() {
        // 1 셀 등록하기
        youTubeTableView.register(
            UINib(nibName: videoID, bundle: nil),
            forCellReuseIdentifier: videoID
        )
        
        // 2 Delegate
        youTubeTableView.delegate = self
        youTubeTableView.dataSource = self
    }
}

extension VideoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoService.count
    }
    
    // UI
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 구성
        let cell = youTubeTableView.dequeueReusableCell(
            withIdentifier: videoID,
            for: indexPath) as! VideoTableViewCell
        
        // 데이터 전달 - 읽기 Read
        let cellData = videoService.read(at: indexPath.row)
        cell.get(data: cellData)
        
        // UI + 데이터
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  (youTubeTableView.bounds.height) * 0.5
    }
    
    
    // cell이 선택됨
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let playVC = storyboard.instantiateViewController(identifier: "PlayViewController") as? PlayViewController else {
            print("Controller not found")
            return
        }
        let cellIndex = indexPath.row
        playVC.key = videoService.read(at: cellIndex).key // 데이터 넘겨주기.
        playVC.top = videoService.read(at: cellIndex).title
        self.navigationController?.pushViewController(playVC, animated: true)
        
    }
}
