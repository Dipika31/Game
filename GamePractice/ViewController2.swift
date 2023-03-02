//
//  ViewController2.swift
//  GamePractice
//
//  Created by Choudhary Dipika on 17/02/23.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func easyButton(_ sender: UIButton) {
        navigationToGamePage1()
    }
    
    @IBAction func mediumModeButton(_ sender: UIButton) {
        navigationToGamePage2()
    }
    
    @IBAction func hardModeButton(_ sender: UIButton) {
        navigationToGamePage3()
    }
    
    func navigationToGamePage1()
    {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "GamePage") as! GamePage
        navigationController?.pushViewController(navigate, animated: true)
        navigate.frequency = 0.07
    }
    
    func navigationToGamePage2()
    {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "GamePage") as! GamePage
        navigationController?.pushViewController(navigate, animated: true)
        navigate.frequency = 0.05
    }
    
    func navigationToGamePage3()
    {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "GamePage") as! GamePage
        navigationController?.pushViewController(navigate, animated: true)
        navigate.frequency = 0.03
    }

}
