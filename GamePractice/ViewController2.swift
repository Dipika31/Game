//
//  ViewController2.swift
//  GamePractice
//
//  Created by Choudhary Dipika on 17/02/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var easyButtonOutlet: UIButton!
    @IBOutlet weak var mediumButtonOutlet: UIButton!
    @IBOutlet weak var hardButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setEasyButton()
        setMediumButton()
        setHardButton()
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
    
    func setEasyButton()
    {
        easyButtonOutlet.layer.borderWidth = 1
        easyButtonOutlet.layer.borderColor = UIColor.white.cgColor
        easyButtonOutlet.layer.shadowRadius = 50
        easyButtonOutlet.layer.shadowColor = UIColor.blue.cgColor
    }
    
    func setMediumButton()
    {
        mediumButtonOutlet.layer.borderWidth = 1
        mediumButtonOutlet.layer.borderColor = UIColor.white.cgColor
        mediumButtonOutlet.layer.shadowRadius = 50
        mediumButtonOutlet.layer.shadowColor = UIColor.blue.cgColor
    }
    
    func setHardButton()
    {
        hardButtonOutlet.layer.borderWidth = 1
        hardButtonOutlet.layer.borderColor = UIColor.white.cgColor
        hardButtonOutlet.layer.shadowRadius = 50
        hardButtonOutlet.layer.shadowColor = UIColor.blue.cgColor
    }

}
