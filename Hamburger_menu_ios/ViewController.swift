//
//  ViewController.swift
//  Homework_29032019
//
//  Created by Anton Sipaylo on 3/29/19.
//  Copyright © 2019 Anton Sipaylo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var mainButtonTrailing: NSLayoutConstraint!
    @IBOutlet weak var mainButtonLeading: NSLayoutConstraint!
    @IBOutlet var menuButtons: [UIButton]!
    let VCName = "ViewController"
    
    let duration = 0.3
    let delay = 0.0
    
    let mainButtonStartCondition = (leading: CGFloat(0), trailing: CGFloat(0), backgroundColor: UIColor.white)
    let mainButtonCompressedCondition = (leading: CGFloat(150), trailing: CGFloat(0), backgroundColor: UIColor.darkGray)
    
    func hideStackView() {
        stackView.isHidden = true
    }
    
    func showStackView() {
        stackView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.isHidden = true
    }
    
    func setMainButtonCharacteristics(_ condition: (leading: CGFloat, trailing: CGFloat, backgroundColor: UIColor)) {
        mainButtonLeading.constant = condition.leading
        mainButtonTrailing.constant = condition.trailing
        mainButton.backgroundColor = condition.backgroundColor
    }
    
    @IBAction func hamburgerMenuPressed(_ sender: Any) {
        if !stackView.isHidden {
            setMainButtonCharacteristics(mainButtonStartCondition)
            hideStackView()
        } else {
            setMainButtonCharacteristics(mainButtonCompressedCondition)
            showStackView()
        }
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }

    @IBAction func mainButtonPressed(_ sender: Any) {
        if !stackView.isHidden {
            self.hamburgerMenuPressed(sender)
        }
    }
    
    @IBAction func touchMenuButton(_ sender: UIButton) {
        let buttonIndex = menuButtons.firstIndex(of: sender)
        var viewController: UIViewController? = nil
        switch buttonIndex {
        case 0:
             viewController = touchMenuButton("Second") as! SecondViewController
        case 1:
            viewController = touchMenuButton("Third") as! ThirdViewController
        case 2:
            viewController = touchMenuButton("Fourth") as! FourthViewController
        default:
            break
        }
        if let VC = viewController {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    func touchMenuButton(_ storyboardName: String) -> UIViewController {
        let viewControllerName = storyboardName + VCName
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        return viewController
    }
    
}

