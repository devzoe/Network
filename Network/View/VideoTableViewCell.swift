//
//  VideoTableViewCell.swift
//  Network
//
//  Created by 남경민 on 2022/12/24.
//

import UIKit
import Kingfisher

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var englishTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor(red: 17/255, green: 18/255, blue: 18/255, alpha: 1)
        self.contentView.backgroundColor = UIColor(red: 17/255, green: 18/255, blue: 18/255, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func get(data: Video) {
        let urlString = "https://img.youtube.com/vi/\(data.key)/0.jpg"
        let fileURL = URL(string: urlString)
        videoImage.kf.setImage(with: fileURL)
        title.text = data.title
        englishTitle.text = data.englishTitle
    }
    
}
