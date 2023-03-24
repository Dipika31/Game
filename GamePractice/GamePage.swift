//
//  GamePage.swift
//  GamePractice
//
//  Created by Choudhary Dipika on 18/02/23.
//

import UIKit

class GamePage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var timeOutBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var lifeLine1: UIImageView!
    @IBOutlet weak var lifeLine2: UIImageView!
    @IBOutlet weak var lifeLine3: UIImageView!
    
    var score = 0
    var highScore = UserDefaults.standard.integer(forKey: "highScore")
    var frequency = 0.1
    // var lifeLineArray : [UIImage] = [lifeLine1.image!]
    var images = [UIImage(named: "Lion"),UIImage(named: "Turtle"),UIImage(named: "Rabbit"),UIImage(named: "Tiger"),UIImage(named: "Elephant"),UIImage(named: "Girafe"),UIImage(named: "Bear"),UIImage(named: "Cat"),UIImage(named: "Dog")]
    var randomImage = UIImage()
    var name = ["Lion","Cat","Dog","Girafe","Elephant","Rabbit","Tiger","Turtle","Bear"]
    var randomName = ""
    var optionalName = "Squirrel"
    var optionalName2 = "Gorilla"
    var life = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.layer.borderColor = UIColor.black.cgColor
        scoreLabel.layer.borderWidth = 1
        scoreLabel.layer.masksToBounds = true
        scoreLabel.layer.cornerRadius = 20
        timeOutBar.progress = 1.0
        time.invalidate()
        timeLine()
        images = images.shuffled()
        name = name.shuffled()
        scoring()
        randomName = name.randomElement()!
    }
    
    
    var time = Timer()
    func timeLine()
    {
        var a : Float = 1.0
        time.invalidate()
        collectionView1.reloadData()
        self.timeOutBar.progress = a
        time = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true, block: { (time) in
            
            a-=0.01
            self.timeOutBar.progress = a
            if self.timeOutBar.progress == 0.0
            {
                self.time.invalidate()
                self.scoring()
                self.displayBox()
            }
        })
    }
    
    
    func displayBox()
    {
        scoring()
        let alert = UIAlertController(title: "GAME OVER", message: "Score = \(score)\n Highscore = \(highScore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.lifeLine1.image = UIImage(systemName: "heart.fill")
            self.lifeLine2.image = UIImage(systemName: "heart.fill")
            self.lifeLine3.image = UIImage(systemName: "heart.fill")
            self.score = 0
            self.life = 1
            self.scoreLabel.text = "\(self.score)"
            self.timeLine()
            self.images = self.images.shuffled()
            self.name = self.name.shuffled()
            self.collectionView1.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Home", style: .default, handler: { _ in
            
            self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!,animated: false)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        if randomName == images[indexPath.row]?.animalName
        {
            cell.img.image = images[indexPath.row]
            cell.nameLabel.text = images[indexPath.row]?.animalName
        } else {
            if randomName == name[indexPath.row]
            {
                cell.img.image = images[indexPath.row]
                cell.nameLabel.text = optionalName
            } else if images[indexPath.row]?.animalName == name[indexPath.row] {
                cell.img.image = images[indexPath.row]
                cell.nameLabel.text = "\(optionalName2)"
            } else {
                cell.img.image = images[indexPath.row]
                cell.nameLabel.text = "\(name[indexPath.row])"
            }
            
        }
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if images[indexPath.row]!.animalName == randomName
        {
            timeLine()
            score+=1
            scoreLabel.text = "\(score)"
            images = images.shuffled()
            name = name.shuffled()
            collectionView1.reloadData()
            randomName = name.randomElement()!
            
        }
        else if life == 1
        {
            lifeLine1.image = UIImage(systemName: "heart")
            life+=1
            timeLine()
            images = images.shuffled()
            name = name.shuffled()
            collectionView1.reloadData()
            randomName = name.randomElement()!
        }
        else if life == 2
        {
            lifeLine2.image = UIImage(systemName: "heart")
            life+=1
            timeLine()
            images = images.shuffled()
            name = name.shuffled()
            collectionView1.reloadData()
            randomName = name.randomElement()!
        }
        else
        {
            lifeLine3.image = UIImage(systemName: "heart")
            life+=1
            displayBox()
            self.time.invalidate()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 107, height: 120)
    }
    
    func scoring()
    {
        if highScore <= score
        {
            highScore = score
            highScoreLabel.text = "High Score : \(highScore)"
            UserDefaults.standard.set(score, forKey: "highScore")
        }
    }
    
    
    //    func didSelect()
    //    {
    //
    // }
}

extension UIImage
{
    var animalName : String
    {
        switch self
        {
        case UIImage(named: "Lion") : return "Lion"
        case UIImage(named: "Turtle") : return "Turtle"
        case UIImage(named: "Rabbit") : return "Rabbit"
        case UIImage(named: "Tiger") : return "Tiger"
        case UIImage(named: "Elephant") : return "Elephant"
        case UIImage(named: "Girafe") : return "Girafe"
        case UIImage(named: "Bear") : return "Bear"
        case UIImage(named: "Cat") : return "Cat"
        case UIImage(named: "Dog") : return "Dog"
        default :
            break
        }
        return ""
    }
}
