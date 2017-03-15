//
//  ViewController.swift
//  Animations Demo
//
//  Created by Talentelgia on 09/11/16.
//  Copyright © 2016 Talentelgia. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    //MARK:- Properties

    @IBOutlet var emailTxtFld: UITextField!
    @IBOutlet var passwordTxtFld: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var bgrndImage: UIImageView!
    
    @IBOutlet var cloud1: UIImageView!
    @IBOutlet var cloud2: UIImageView!
    @IBOutlet var cloud3: UIImageView!
    @IBOutlet var cloud4: UIImageView!
    
    @IBOutlet var bird1: UIImageView!
    @IBOutlet var bird2: UIImageView!
    @IBOutlet var bird3: UIImageView!
    
    //MARK:- View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let blueColor : UIColor = UIColor( red: 68.0/255, green: 126.0/255, blue:194.0/255, alpha: 1.0 )
        
        //Implementing Layers,Border Color & Width
        emailTxtFld.layer.borderColor = blueColor.cgColor
        emailTxtFld.layer.borderWidth = 2
        emailTxtFld.layer.cornerRadius = 5
        
        passwordTxtFld.layer.borderColor = blueColor.cgColor
        passwordTxtFld.layer.borderWidth = 2
        passwordTxtFld.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 15
        //Testing for commit purpose.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        //Moving the elements off-screen
        loginLabel.center.y -= view.bounds.width
        emailTxtFld.center.x -= view.bounds.width
        passwordTxtFld.center.x += view.bounds.width
        loginBtn.center.x += view.bounds.width

      //Setting alpha to clouds
        cloud1.alpha = 0.0
        cloud2.alpha = 0.0
        cloud3.alpha = 0.0
        cloud4.alpha = 0.0
        bird1.alpha = 0.0
        bird2.alpha = 0.0
        bird3.alpha = 0.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        //Bringing back the login label with animation
        
        UIView.animate(withDuration: 2.0, animations: {
            self.loginLabel.center.y += self.view.bounds.width
        })
        
        //Using spring animation in email,password textFields and login Button
        
        UIView.animate(withDuration: 2, delay: 0.5,
                       usingSpringWithDamping: 2.0,
                       initialSpringVelocity: 2.0,
                       options: [], animations: {
                        self.emailTxtFld.center.x += self.view.bounds.width
                        self.passwordTxtFld.center.x -= self.view.bounds.width
                        self.loginBtn.center.x -= self.view.bounds.width
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [], animations: {
            self.cloud1.alpha = 1.0
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.8, options: [], animations: {
            self.cloud2.alpha = 1.0
            self.bird1.alpha = 1.0

            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.0, options: [], animations: {
            self.cloud3.alpha = 1.0
            self.bird2.alpha = 1.0

            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1.2, options: [], animations: {
            self.cloud4.alpha = 1.0
            self.bird3.alpha = 1.0
            }, completion: nil)
        
        //Calling animateTheClouds()
        
        animateTheClouds(cloud1)
        animateTheClouds(cloud2)
        animateTheClouds(cloud3)
        animateTheClouds(cloud4)
        animateTheBirds(bird1)
        animateTheBirds(bird2)
        animateTheBirds(bird3)
        
    }
    

    //function to add animation loop to clouds
    
    func animateTheClouds(_ cloud : UIImageView) {
        let cloudMovingSpeed = 50.0/view.frame.size.width
        let duration = (view.frame.size.width - cloud.frame.origin.x) * cloudMovingSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear, animations: {
            cloud.frame.origin.x = self.view.frame.size.width
            }, completion: {_ in
                cloud.frame.origin.x = -cloud.frame.size.width
                self.animateTheClouds(cloud)
        })
    }

     //function to add animation loop to Birds
    
    func animateTheBirds(_ bird : UIImageView) {
        let BirdMovingSpeed = 20.0/view.frame.size.width
        let duration = (view.frame.size.width - bird.frame.origin.x) * BirdMovingSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .transitionCurlUp, animations: {
            bird.frame.origin.x = self.view.frame.size.width
            }, completion: {_ in
                bird.frame.origin.x = -bird.frame.size.width
                self.animateTheBirds(bird)
        })
    }
    
}

