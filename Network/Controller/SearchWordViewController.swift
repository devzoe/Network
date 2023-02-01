//
//  SearchWordViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/23.
//

import UIKit

class SearchWordViewController: UIViewController {
    var searchMeaning : SearchMeaning = SearchMeaning()
    var wordService: WordService = WordService()
    var vocaBookService: VocaBookService = VocaBookService.shared
    let wordID = "WordTableViewCell"
    
    //서치바 만들기
    var searchBar = UISearchBar()
   

    @IBOutlet weak var wordTableView: UITableView!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("search word view did load")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        setSearchBar()
        searchBar.delegate = self
        self.navigationController?.navigationBar.topItem?.titleView?.isHidden = false

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        //네비게이션에 서치바 넣기
        self.navigationController?.navigationBar.topItem?.titleView?.isHidden = true
        wordService.remove()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
 
    //서치바 세팅
    func setSearchBar(){
        searchBar.placeholder = "단어를 검색하세요"
        //왼쪽 서치아이콘 이미지 세팅하기
        searchBar.setImage(UIImage(named: "icSearchNonW"), for: UISearchBar.Icon.search, state: .normal)
        //오른쪽 x버튼 이미지 세팅하기
        searchBar.setImage(UIImage(named: "icCancel"), for: .clear, state: .normal)
        //네비게이션에 서치바 넣기
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            //서치바 백그라운드 컬러
            textfield.backgroundColor = UIColor.black
            //플레이스홀더 글씨 색 정하기
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            //서치바 텍스트입력시 색 정하기
            textfield.textColor = UIColor.white
            //왼쪽 아이콘 이미지넣기
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                //이미지 틴트컬러 정하기
                leftView.tintColor = UIColor.white
            }
            //오른쪽 x버튼 이미지넣기
            if let rightView = textfield.rightView as? UIImageView {
                rightView.image = rightView.image?.withRenderingMode(.alwaysTemplate)
                //이미지 틴트 정하기
                rightView.tintColor = UIColor.white
            }
            
        }
    }
    
    func getWordTable() {
        setupWordTableView()
        wordTableView.reloadData()
    }
    
    private func setupWordTableView() {
        // 1 셀 등록하기
        wordTableView.register(
            UINib(nibName: wordID, bundle: nil),
            forCellReuseIdentifier: wordID
        )
        
        // 2 Delegate
        wordTableView.delegate = self
        wordTableView.dataSource = self
    }
    
    
}

extension SearchWordViewController: UISearchBarDelegate {
    
    private func dissmissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //remove
        wordService.remove()
        // 검색 시작
        //키보드가 올라와 있을떄, 내려가게
        dissmissKeyboard()
        
        // 검색어가 있는지
        guard let searchTerm = searchBar.text, searchTerm.isEmpty == false else { return }
        print("--> 검색어: \(searchTerm)")
        //word.updateWord(searchTerm)
        //word.updateLanguage("en")
        searchMeaning.searchMeaning(wordService, searchTerm, "en", self)
        
    }
    
}

extension SearchWordViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordService.count
    }
    
    // UI
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 구성
        let cell = wordTableView.dequeueReusableCell(
            withIdentifier: wordID,
            for: indexPath) as! WordTableViewCell
        
        // 데이터 전달 - 읽기 Read
        let cellData = wordService.read(at: indexPath.row)
        cell.get(data: cellData)
        cell.vocaWord = cellData.word
        cell.vocaPartOfSpeech = cellData.partOfSpeech
        cell.vocaDefinition = cellData.definition
        cell.delegate = self
        
        // UI + 데이터
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  (wordTableView.bounds.height) * 0.25
    }
    
    
        
}
extension SearchWordViewController: ButtonTappedDelegate {
    func cellButtonTapped(word:String,partOfSpeech:String,definition:String) {
        print("Button Tapped")
        vocaBookService.add(word,partOfSpeech,definition)
    }
    
    
    // cell이 선택됨
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let wordDetailVC = storyboard.instantiateViewController(identifier: "WordDetailViewController") as? WordDetailViewController else {
            print("Controller not found")
            return
        }
        let cellIndex = indexPath.row
        wordDetailVC.word = wordService.read(at: cellIndex) // 데이터 넘겨주기.
        self.navigationController?.pushViewController(wordDetailVC, animated: true)
        
    }
}
