//
//  ViewController.swift
//  Lonely Planet
//
//  Created by Nike.Wu on 2020/2/1.
//  Copyright © 2020 Suzy.Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var weatherTextView: UITextView!
    @IBOutlet weak var maskView: UIView!
    @IBOutlet weak var forthView: UIView!
    @IBOutlet weak var yourRatingView: UIView!
    @IBOutlet weak var yourRatingFirstImageView: UIImageView!
    @IBOutlet weak var yourRatingSencondImageView: UIImageView!
    @IBOutlet weak var yourRatingThirdImageView: UIImageView!
    @IBOutlet weak var yourRatingForthImageView: UIImageView!
    @IBOutlet weak var yourRatingFifthImageView: UIImageView!

    @IBOutlet weak var submitBtn: UIButton!
    

    var ratingView:UIView!
    var starView:UIView!

    
    var ratingTableView:UITableView!
    
    var deleteYourRatingBtn:UIButton!
    
    let menuArray = ["Boring","Meh","It's OK","Like it","Fantastic!"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // add resture recognizer
        
        let longPess = UILongPressGestureRecognizer(target: self, action: #selector(submitRatingClick))
        self.submitBtn.addGestureRecognizer(longPess)

        starView = UIView.init(frame: CGRect.init(x: 220, y: 230, width: 80, height: 80))
        starView.backgroundColor = .white
        let starImage = UIImageView.init(frame: CGRect.init(x: 15, y: 15, width: 50, height: 50));
        starImage.image = UIImage.init(named: "star");
        ratingTableView = UITableView.init(frame: CGRect.init(x: 200, y: 320, width: 200, height: 220), style: .plain)
        deleteYourRatingBtn = UIButton.init(frame: CGRect.init(x: 200, y: 550, width: 200, height: 40))
        deleteYourRatingBtn.setTitle("Remove rating", for: .normal)
        deleteYourRatingBtn.backgroundColor = .white
        deleteYourRatingBtn.setTitleColor(.red, for: .normal)
        
        deleteYourRatingBtn.addTarget(self, action: #selector(deleteYourRatingClick), for: .touchUpInside)
        ratingTableView.backgroundColor = .white
        ratingTableView.delegate = self
        ratingTableView.alpha = 1.0
        ratingTableView.dataSource = self
        ratingTableView.layer.masksToBounds = true
        ratingTableView.layer.cornerRadius = 5.0
        deleteYourRatingBtn.layer.masksToBounds = true
        deleteYourRatingBtn.layer.cornerRadius = 5.0
        
        starView.layer.masksToBounds = true
        starView.layer.cornerRadius = 5.0
        starView.addSubview(starImage)
        maskView.addSubview(ratingTableView)
        maskView.addSubview(deleteYourRatingBtn)
        maskView.addSubview(starView);
        yourRatingView.isHidden = true
        yourRatingFirstImageView.isHidden = true
        yourRatingSencondImageView.isHidden = true
        yourRatingThirdImageView.isHidden = true
        yourRatingForthImageView.isHidden = true
        // Do any additional setup after loading the view.
    }


    @objc func submitRatingClick() {
        ratingTableView.reloadData()
        maskView.isHidden = false
    }
    @objc func deleteYourRatingClick(){
        yourRatingFirstImageView.isHidden = true
        yourRatingSencondImageView.isHidden = true
        yourRatingThirdImageView.isHidden = true
        yourRatingForthImageView.isHidden = true
        yourRatingFifthImageView.isHidden = true
        maskView.isHidden = true
        yourRatingView.isHidden = true
        submitBtn.setTitle("Submit Rating", for: .normal)

    }
    @IBAction func hideOrShowWeatherClick(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.4, animations: {
                   if sender.currentTitle! == "Hide" {
                       self.forthView.center.y -= 150
                                        self.weatherTextView.isHidden = true
                        self.weatherTextView.alpha = 0.0
                        sender.setTitle("Show", for: .normal)

                   }else {
                       self.weatherTextView.alpha = 1.0
                       self.forthView.center.y += 150
                    self.weatherTextView.isHidden = false
                    sender.setTitle("Hide", for: .normal)

                   }
               })
        
       
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "reusableCell")
        //var cell = UITableViewCell(style: .default, reuseIdentifier: "reusableCell")
        //reusableCell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        //cell!.textLabel?.text = "\(menuArray[indexPath.row])"
        //return cell!
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
//            cell!.backgroundColor = UIColor.clear
//            cell!.textLabel?.textColor = UIColor.darkText
//
//            let selectedView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
//            selectedView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
//
//            cell!.selectedBackgroundView = selectedView
        }

        cell!.textLabel?.text = menuArray[indexPath.row]

        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(menuArray[indexPath.row])
        maskView.isHidden = true
        yourRatingView.isHidden = false
        switch indexPath.row {
        case 0:
            yourRatingFirstImageView.isHidden = false
            yourRatingSencondImageView.isHidden = true
            yourRatingThirdImageView.isHidden = true
            yourRatingForthImageView.isHidden = true
            yourRatingFifthImageView.isHidden = true
            break
        case 1:
            yourRatingFirstImageView.isHidden = false
            yourRatingSencondImageView.isHidden = false
            yourRatingThirdImageView.isHidden = true
            yourRatingForthImageView.isHidden = true
            yourRatingFifthImageView.isHidden = true
            break
        case 2:
            yourRatingFirstImageView.isHidden = false
            yourRatingSencondImageView.isHidden = false
            yourRatingThirdImageView.isHidden = false
            yourRatingForthImageView.isHidden = true
            yourRatingFifthImageView.isHidden = true
            break
        case 3:
            yourRatingFirstImageView.isHidden = false
            yourRatingSencondImageView.isHidden = false
            yourRatingThirdImageView.isHidden = false
            yourRatingForthImageView.isHidden = false
            yourRatingFifthImageView.isHidden = true
            break
        case 4:
            yourRatingFirstImageView.isHidden = false
            yourRatingSencondImageView.isHidden = false
            yourRatingThirdImageView.isHidden = false
            yourRatingForthImageView.isHidden = false
            yourRatingFifthImageView.isHidden = false
            break
        default:
            break
        
            
        }
        submitBtn.setTitle("Update Rating(\(indexPath.row+1))", for: .normal)

    }
}

