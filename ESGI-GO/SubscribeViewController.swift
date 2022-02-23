//
//  SubscribeViewController.swift
//  ESGI-GO
//
//  Created by Benoit Briatte on 13/01/2022.
//

import UIKit

class SubscribeViewController: UIViewController {

    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var validateButton: UIButton!
    @IBOutlet var sexSegmentedControl: UISegmentedControl!
    
    func localization() {
        self.nicknameTextField.placeholder = NSLocalizedString("controllers.subscribe.nickname", comment: "")
        self.heightTextField.placeholder = NSLocalizedString("controllers.subscribe.height", comment: "")
        self.titleLabel.text = NSLocalizedString("controllers.subscribe.title", comment: "")
        self.validateButton.setTitle(NSLocalizedString("controllers.subscribe.validate", comment: ""), for: .normal)
        self.sexSegmentedControl.setTitle(NSLocalizedString("controllers.subscribe.sex.male", comment: ""), forSegmentAt: 0)
        self.sexSegmentedControl.setTitle(NSLocalizedString("controllers.subscribe.sex.female", comment: ""), forSegmentAt: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.localization()
    }

    @IBAction func handleValidate() {
//        guard let nickname = self.nicknameTextField.text,
//              let height = self.heightTextField.text,
//              let heightFloat = Float(height),
//              let sex = Sex(rawValue: self.sexSegmentedControl.selectedSegmentIndex) else {
//                  return
//        }
//        let nicknameTrim = nickname.trimmingCharacters(in: .whitespacesAndNewlines)
//        guard !nicknameTrim.isEmpty else {
//            return
//        }
//        let student = Student(nickname: nicknameTrim, sex: sex, height: heightFloat)
//        self.navigationController?.pushViewController(MapViewController.newInstance(student: student), animated: true)
    }
    
}
