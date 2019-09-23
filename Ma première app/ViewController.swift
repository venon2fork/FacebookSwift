//
//  ViewController.swift
//  Ma première app
//
//  Created by jodo on 06/08/2019.
//  Copyright © 2019 jodo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var littleButtons: [UIButton]!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    var couleur: [UIColor] = [.white, .systemTeal, .systemGray]
    var position: CGPoint?
    var frame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Ajouter des interactions (gestures)
         creer une variable tap
         */
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(holderViewTapped))
        tap.numberOfTapsRequired = 2
        //let long = UILongPressGestureRecognizer(target: self, action: #selector(holderViewTapped))
        holderView.addGestureRecognizer(tap)
        
        //______________________________________________
        
        // Descript : Donner une couleur background au bouton A
        buttonA.backgroundColor = .red
        
        //______________________________________________
        
        
        // Descript : Donner une couleur a l'icone present dans le boutonA puis bouton B
        buttonA.tintColor = .white
        buttonB.tintColor = .white
        
        //______________________________________________
        
        
        // Descript : Donner une couleur a la holderView
        holderView.backgroundColor = UIColor.white
        
        //______________________________________________
        
        
        /*
         Descript : Donner une couleur background
            |-> buttonB.backgroundColor = UIColor.lightGray
         */
        
        //______________________________________________
        
        
        
        /*
         Descript : Modifie le text present dans le bouton B
             |-> buttonB.setTitle("Bouton B", for: .normal)
         */
        
        //______________________________________________
        
        
        /*
         Descript : Modifie l'image dans le bouton B
             |-> buttonB.setImage(UIImage(systemName: "house.fill"), for: .normal)
         */
        
        //______________________________________________
        
        
        // Creer une Boucle pour iterer sur les trois boutons
        for index in 0..<littleButtons.count {
            // pour chaque bouton change le format du texte
            littleButtons[index].setTitle("", for: .normal)
            // pour chaque bouton on change la couleur
            // que l 'on va chercher dans le tableau Couleur
            littleButtons[index].backgroundColor = couleur[index]
            
            // on transforme en cercle les bouton
            littleButtons[index].layer.cornerRadius = littleButtons[index].frame.width / 2
            
            /*
             Sur chaque bouton on creer une bordure
             puis on donne une couleur a la bordure
             //littleButtons[index].layer.borderWidth = 2
             //littleButtons[index].layer.borderColor = UIColor.red.cgColor
             */
           
        }
        
        //______________________________________________
        
        // Permet d'arrondi les angles des boutons
        buttonA.layer.cornerRadius = 20
        buttonB.layer.cornerRadius = 20
        
        // Permet de changer le texte
        //textLabel.text = "J'ai changé de texte"
        
        // Permet de changer la couleur
        //textLabel.textColor = .red
        
        // Permet de changer la fonts
        //textLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        
        //Permet de changer la font et la taille
        //textLabel.font = UIFont(name: "Chalkduster", size: 30)
        
        // Permet d'arrondi les angles
        holderView.layer.cornerRadius = 20
        
        // on transforme en cercle
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
        // Permet de changer la couleur
        profileImageView.layer.borderColor = UIColor.white.cgColor
        
        // Permet de donner une bordure
        profileImageView.layer.borderWidth = 2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                position = profileImageView.center
                frame = profileImageView.frame
            }
        }
    }
    
    
    /*
     
     
     */
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                //Déplacer la vue
                let touchPosition = first.preciseLocation(in: self.view)
                profileImageView.center = touchPosition
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                if frame != nil {
                    profileImageView.frame = frame!
                }
                
            }
        }
    }
    
    
    /*
     Afin d'Utiliser Gesture Il faut creer une Fonction en ObjC
     */
    @objc func holderViewTapped() {
        // Permet de definir que l'etat doit etre different de l'etat connu
        textLabel.isHidden = !textLabel.isHidden
    }

    
    @IBAction func buttonAPressed(_ sender: UIButton) {
        textLabel.textColor = .red
    }
    
    @IBAction func buttonBPressed(_ sender: Any) {
        textLabel.textColor = .green
    }
    
    @IBAction func littleButtonsPressed(_ sender: UIButton) {
        holderView.backgroundColor = couleur[sender.tag]
    }
    
    
    
}

