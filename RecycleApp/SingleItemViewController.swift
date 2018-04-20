//
//  SingleItemViewController.swift
//  RecycleApp
//
//  Created by Joni Tefke on 18/04/2018.
//  Copyright © 2018 Joni Tefke. All rights reserved.
//

import UIKit

class SingleItemViewController: UIViewController {

    var thing: String = ""
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = thing
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
