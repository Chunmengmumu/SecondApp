//
//  ViewController.swift
//  SecondApp
//
//  Created by Shengwei Liu on 2017/11/1.
//  Copyright © 2017年 Shengwei Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Age: UITextField!
    
    @IBOutlet weak var Height: UITextField!
    
    @IBOutlet weak var Weight: UITextField!
    
    var REE = 0
    var a = 0
    var b = 0
    var c = 0
    var k = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //选项除了文字还可以是图片
        let items = ["MALE", "FAMALE"] as [Any]
        let segmented = UISegmentedControl(items:items)
        //设置 UISegemtedControl 的中心点
        segmented.center = self.view.center

        //segmented.selectedSegmentIndex = 0 //默认选中第二项
        segmented.addTarget(self, action: #selector(ViewController.segmentDidchange(_:)),
                            for: .valueChanged)  //添加值改变监听
        self.view.addSubview(segmented)
        
        
    }

    @objc func segmentDidchange(_ segmented:UISegmentedControl){
        //获得选项的索引
        if segmented.selectedSegmentIndex == 0 {k = 5}
        else if segmented.selectedSegmentIndex == 1 {k = -161}
//        //获得选择的文字
//        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex))

    }
    //}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//第一个界面选择运动量
    
    
    @IBAction func Little(_ sender: Any) {
        UIButton * btnType=[[UIButton alloc]init];
        [btn addTarget:self action:@selector(buttonClick) forCOntrolEvents:UIControlEventTouchUpInside];
    }
    
    func buttonTapped(sender: UIButton){
        var PA = 1.2
    }
    
    @IBAction func Light(_ sender: Any) {
        var PA = 1.375
    }
    
    @IBAction func Moderate(_ sender: Any) {
        var PA = 1.55
    }
    
    @IBAction func Heavy(_ sender: Any) {
        var PA = 1.725
    }
    
    @IBAction func VeryHeavy(_ sender: Any) {
        var PA = 1.9
    }
    
    
    
    @IBAction func CalculateMaleREE(_ sender: Any) {
        let age = Age.text!
        let height = Height.text!
        let weight = Weight.text!
        
        Age.clearButtonMode = .whileEditing  //编辑时出现清除按钮
        Height.clearButtonMode = .whileEditing  //编辑时出现清除按钮
        Weight.clearButtonMode = .whileEditing  //编辑时出现清除按钮
      
        
        
        if (age != nil || height != nil || weight != nil){
//        func textField(textField:UITextField, shouldChangeCharactersInRange range:NSRange, replacementString string: String) -> Bool {
//                if Age == textField {
//                    //限制只能输入数字，不能输入特殊字符
//                    let length = string.lengthOfBytes(using: String.Encoding.utf8)
//                    for loopIndex in 0..<length {
//                        let char = (string as NSString).character(at: loopIndex)
//                        if char < 48 {return false }
//                        if char > 57 {return false }
           // Little to no exercise
           //let PA1 = 1.2
           // Light exercise (1–3 days per week)
           //let PA2 = 1.375
           // Moderate exercise (3–5 days per week)
           //let PA3 = 1.55
           // Heavy exercise (6–7 days per week)
           //let PA4 = 1.725
           // Very heavy exercise (twice per day, extra heavy workouts)
           //let PA5 = 1.9

           
            var message = ""
            a = Int(10 * Float(weight)!)
            b = Int(6.25 * Float(height)!)
            c = 5 * Int(age)!
            REE = a + b - c + k
         
//Males: REE = 10 x weight (kg) +6.25 x height (cm) – 5 x age (y) + 5
//Females: REE = 10 x weight (kg) + 6.25 x height (cm) – 5 x age (y) – 161

            if k == 5{
                message = "Your REE is \(REE).(MALE)"
            }
            else if k == -161{
                message = "Your REE is \(REE).(FAMALE)"
            }
            
//Daily Calorie Needs (kcals) = REE x PA (physical activity level input)
//(REE – Resting energy expenditure)
            
            var Calorie = REE * Int(PA)

//For weight loss:
//Subtract Daily Calorie Needs by 500;
//Protein needs (g) = 0.8 g/kg * body weight(kg)
//Carbohydrate needs (g) = (0.45 * Daily Calorie Needs)/4 to (0.65*Daily Calorie Needs)/4
//Fat needs (g) = (0.2* Daily Calorie Needs)/9 to (0.35* Daily Calorie Needs)/9

//For muscle gain:
//Protein needs (g) = 1 g/kg * body weight(kg) to 1.2 g/kg * body weight(kg)
//Carbohydrate needs (g) = (0.45 * Daily Calorie Needs)/4 to (0.65*Daily Calorie Needs)/4
//Fat needs (g) = (0.2* Daily Calorie Needs)/9 to (0.35* Daily Calorie Needs)/9
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "确定", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else {
            let alert = UIAlertController(title: nil, message: "请输入数字", preferredStyle: .alert)
            let action = UIAlertAction(title: "确定", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
                }
    }
}

