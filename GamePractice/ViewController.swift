//
//  ViewController.swift
//  GamePractice
//
//  Created by Choudhary Dipika on 16/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var loaderProgressBar: UIProgressView!
    var a = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.layer.borderColor = UIColor.black.cgColor
        playButton.layer.borderWidth = 1
        playButton.layer.masksToBounds = true
        playButton.layer.cornerRadius = 1
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        navigation()
    }

    func navigation ()
    {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigate, animated: true)
    }
}

