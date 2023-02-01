//
//  TabViewController.swift
//  Network
//
//  Created by 남경민 on 2022/12/22.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    let user: User = User.shard
    @IBOutlet weak var name: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.name.title = user.readName() + " 님"
        self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = UIColor(red: 17/255, green: 18/255, blue: 18/255, alpha: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // tab에 보여질 VC 추가
        if let firstVC = storyboard?.instantiateViewController(withIdentifier: "navigation1") as? UINavigationController {
            viewControllers.append(firstVC)
        }
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "navigation2") as? UINavigationController {
            viewControllers.append(secondVC)
        }
        if let thirdVC = storyboard?.instantiateViewController(withIdentifier: "navigation3") as? UINavigationController {
            viewControllers.append(thirdVC)
        }
        if let fourthVC = storyboard?.instantiateViewController(withIdentifier: "navigation4") as? UINavigationController {
            viewControllers.append(fourthVC)
        }
        if let fifthVC = storyboard?.instantiateViewController(withIdentifier: "navigation5") as? UINavigationController {
            viewControllers.append(fifthVC)
        }

        
        self.dataSource = self
        // 스와이프 disable
        // self.isScrollEnabled = false
        
        // 바 생성 + tabbar 에 관한 디자인처리를 여기서 하면 된다.
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        //배경색
        bar.backgroundView.style = .clear
        bar.backgroundColor = UIColor(red: 17/255, green: 18/255, blue: 18/255, alpha: 1)
        // tab 밑 bar 색깔 & 크기
        bar.indicator.weight = .custom(value: 1)
        bar.indicator.tintColor = .white
        // tap center
        bar.layout.alignment = .centerDistributed
        // tap 사이 간격
        bar.layout.interButtonSpacing = 40
        // tap 선택 / 미선택
        bar.buttons.customize { (button) in
            button.tintColor = .
            gray
            button.selectedTintColor = .white
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        
        // bar를 안보이게 하고 싶으면 addBar를 지우면 된다. at -> bar 위치
        addBar(bar, dataSource: self, at: .top)
    }
}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
        // return .at(index: 0) -> index를 통해 처음에 보이는 탭을 설정할 수 있다.
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
         var title: String = ""
        if (index == 0) {
            title = "홈"
        } else if (index == 1) {
            title = "번역"
        } else if (index == 2) {
            title = "검색"
        } else if (index == 3) {
            title = "단어장"
        } else if (index == 4) {
            title = "유튜브 학습"
        }
        item.title = title
        return item
    }
}
