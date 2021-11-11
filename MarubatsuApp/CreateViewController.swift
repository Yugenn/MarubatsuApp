//
//  CreateViewController.swift
//  MarubatsuApp
//
//  Created by 祐源宏行 on 2021/11/08.
//

import UIKit

class CreateViewController: UIViewController {


    @IBOutlet weak var questionField: UITextField!
    
    @IBOutlet weak var selectButton: UISegmentedControl!
    var questions:[[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func topButton(_ sender: Any) {
    //一つ前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
    //questionFieldの中の問題文を配列に保存する
        if questionField.text! != "" {
            var marubatsuAnswer: Bool = true
            
            if selectButton.selectedSegmentIndex == 0 {
                marubatsuAnswer = false
        
        } else {
            marubatsuAnswer = true
        }
            
            let userDefaults = UserDefaults.standard
            questions = []
            
            if userDefaults.object(forKey: "questions") != nil {
                questions = userDefaults.object(forKey: "questions") as! [[String: Any]]
            }
            questions.append(
                [
                    "question": questionField.text!,
                    "answer": marubatsuAnswer
                ])
            userDefaults.set(questions, forKey: "questions")
            showAlert(message: "問題が保存されました")
            questionField.text = ""
            
        } else {
            showAlert(message: "問題文を入力してください。")
        }
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
    //配列を空の状態にする
        let userDefaults = UserDefaults.standard
        
        //保存されている問題と回答をすべて削除
        userDefaults.removeObject(forKey: "questions")
        userDefaults.set([], forKey: "questions")
        showAlert(message: "問題をすべて削除しました。")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
