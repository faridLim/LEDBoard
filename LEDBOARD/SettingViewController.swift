//
//  SettingViewController.swift
//  LEDBOARD
//변경하려는 색상 값에 대한 데이터를 ViewController로 전달하기위해 delegate패턴사용
//  Created by 임재헌 on 2021/09/28.
//

import UIKit

protocol LEDBoardSettingDelegate : AnyObject{
    func changedSetting(text : String?, textColor : UIColor, backgroundColor : UIColor)
}


class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    
    weak var delegate : LEDBoardSettingDelegate?
    var textColor : UIColor = .yellow  //초기 ViewController에 나타난 색상으로 초기값 설정
    var backgroundColor : UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //하나의 버튼에 대해서만 Action함수 걸어놓고, 나머지 버튼은 동일함수에 연결만 하면됨
    //세개의 버튼을 누를때마다 모두 동일한 tabTextColrBtn이 호출되지만 세개의 버튼 중 어떠한 버튼을 눌렀는지는 sender파라미터로 알 수 잇음!
    //각 버튼에 해당하는 인스턴스가 sender로 전달
    @IBAction func tabTextColorBtn(_ sender: UIButton) {
        //사용자가 어떤 버튼을 클릭횄는지 표시되도록 선택된 버튼의 알파값을 1로, 선택되지 않은 버튼의 알파값을 0.2로 변경
        if sender == self.yellowBtn{
            self.changeTextColorBtn(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleBtn{
            self.changeTextColorBtn(color: .purple)
            self.textColor = .purple
        } else {
            self.changeTextColorBtn(color: .green)
            self.textColor = .green
        }

    }
    @IBAction func tabBackgroundColorBtn(_ sender: UIButton) {
        if sender == self.blackBtn {
            self.changeBackgroundColorBtn(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueBtn{
            self.changeBackgroundColorBtn(color: .blue)
            self.backgroundColor = .blue
        } else {
            self.changeBackgroundColorBtn(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    @IBAction func tabSaveBtn(_ sender: UIButton) {
        self.delegate?.changedSetting(text: self.textField.text,
                                      textColor: self.textColor,
                                      backgroundColor: self.backgroundColor)
    }
    private func changeTextColorBtn(color : UIColor){
        //parameter로 전달받은 color가 'UIColor.yellow'에 해당하면 self.yellowBtn에 1을 아니면 0.2를 할당
        self.yellowBtn.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleBtn.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenBtn.alpha = color == UIColor.green ? 1 : 0.2
    }
    private func changeBackgroundColorBtn(color : UIColor){
        self.blackBtn.alpha = color == UIColor.black ? 1 : 0.2
        self.blueBtn.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeBtn.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
