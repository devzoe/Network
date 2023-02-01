//
//  WordTableViewCell.swift
//  Network
//
//  Created by 남경민 on 2022/12/23.
//

import UIKit
protocol ButtonTappedDelegate {
    func cellButtonTapped(word : String, partOfSpeech:String, definition:String)
}
class WordTableViewCell: UITableViewCell {

    var delegate: ButtonTappedDelegate?
    var vocaWord: String = ""
    var vocaPartOfSpeech = ""
    var vocaDefinition = ""
  
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var partOfSpeech: UILabel!
    @IBOutlet weak var meaning: UILabel!
    @IBOutlet weak var addButton: UIButton!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor(red: 17/255, green: 18/255, blue: 18/255, alpha: 1)
        self.contentView.backgroundColor = UIColor(red: 17/255, green: 18/255, blue: 18/255, alpha: 1)
        
    }
    public func get(data: Word) {
        
        wordLabel.text = data.word
        partOfSpeech.text = data.partOfSpeech
        meaning.text = data.definition
    }
    public func getVocaBook(data: VocaBookWord) {
        wordLabel.text = data.word
        partOfSpeech.text = data.partOfSpeech
        meaning.text = data.definition
        addButton.isHidden = true
    }
   
    @IBAction func addVocaBook(_ sender: Any) {
        print("add voca")
        self.delegate?.cellButtonTapped(word: vocaWord, partOfSpeech: vocaPartOfSpeech, definition: vocaDefinition)
    }
    
}

