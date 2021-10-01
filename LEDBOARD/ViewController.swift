//
//  ViewController.swift
//  LEDBOARD
//
//  Created by 임재헌 on 2021/09/27.
//

import UIKit

class ViewController: UIViewController,LEDBoardSettingDelegate {
    @IBOutlet weak var contentsLabel: UILabel!
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if  text != nil{
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
        
    }
    //segueway객체를 사용하기 때문에 prepare 메서드를 정의할 수 있고, 해당 메서드 내에서 다음 ViewController를 인스턴스화 할 수 있음
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController{
            settingViewController.delegate = self
        }
    }

}

