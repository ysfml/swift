//
//  ViewController.swift
//  youssefmalyani
//
//  Created by MOUADONA on 11/01/2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return mygift.count
        return mygiftfilter.count  // Question 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableview.dequeueReusableCell(withIdentifier: "y", for: indexPath) as! TableViewCell
        let row = indexPath.row
        
        cell.nom.text = mygiftfilter[row].nom
        cell.prix.text = String(mygiftfilter[row].prix)
        return cell
    }
    
    
    
    
    
    
    let gifts = ["Console PS5", "Joystick", "Fifa 23", "iPhone 14", "Coque iPhone ", "Protection iPhone ", "Magic Mouse", "Webcam", "Mac book Pro", "Rubik Cube", "Sac de transport Ordinateur", "Boite de thè", "Lot de crayons", "Livre Les échecs pour les nuls", "Pull moche de Noel", "Casque VR"]

    let prices = [499.00, 69.00, 58.99, 1290.00, 29.99, 9.99, 50.00, 84.90, 2000.00, 20.00, 59.99, 15.24, 2.00, 25.00, 15.00, 500.00]
    var mygift =  [Gift]()
    var mygiftfilter =  [Gift]() // Question 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // QUESTION 2
        for i in 0...gifts.count-1
        {
            mygift.append( Gift(nom: gifts[i], prix: prices[i]))
            print(mygift[i].nom, mygift[i].prix)
            
        }
        // NE PAS OUBLIER
        mytableview.dataSource = self
        
    }
    
 
    
    
    
    @IBOutlet weak var mytableview: UITableView!
    
    
    // tri question 4
    @IBAction func trier(_ sender: Any) {
        mygift.sort(by: {$0.prix <  $1.prix})
        
        mytableview.reloadData()
        }
    
    
 //Filtrer Question 5
    @IBAction func filtre(_ sender: UISlider) {
        
        prixval.text = String(sender.value)
        mygiftfilter = mygift.filter ( {$0.prix < Double(sender.value)})
        mytableview.reloadData()
        
        
    }
    
    
    
    
    
    
    
    @IBOutlet weak var prixval: UILabel!
    
    
    
    
   
    // Question 6
    
    @IBAction func reset(_ sender: Any) {
        
        mygiftfilter = mygift
        mytableview.reloadData()
        
    }
    
    
    
}

