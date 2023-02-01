//
//  WordDetailViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/24.
//

import UIKit

class WordDetailViewController: UIViewController {
    var word: Word = Word(languge: "", word: "", partOfSpeech: "", definition: "", example: "")
    @IBOutlet weak var mainWord: UILabel!
    @IBOutlet weak var partOfSpeech: UILabel!
    @IBOutlet weak var definition: UILabel!
    @IBOutlet weak var example: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mainWord.text = word.word
        partOfSpeech.text = word.partOfSpeech
        definition.text = word.definition
        example.text = word.example
    }

}
