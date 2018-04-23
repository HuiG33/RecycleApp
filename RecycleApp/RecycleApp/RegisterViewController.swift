//
//  RegisterViewController.swift
//  RecycleApp
//
//  Created by Joni Tefke on 18/04/2018.
//  Copyright © 2018 Joni Tefke. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //UI objects
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var repeatPasswordInput: UITextField!
    @IBOutlet weak var alertMessage: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //register button clicked
    @IBAction func register_click(_ sender: Any) {
        
        //if no text entered
        if emailInput.text!.isEmpty || passwordInput.text!.isEmpty || repeatPasswordInput.text!.isEmpty{
            emailInput.attributedPlaceholder = NSAttributedString(string: "Email", attributes:[NSAttributedStringKey.foregroundColor: UIColor.red])
            passwordInput.attributedPlaceholder = NSAttributedString(string: "Password", attributes:[NSAttributedStringKey.foregroundColor: UIColor.red])
            repeatPasswordInput.attributedPlaceholder = NSAttributedString(string: "Repeat password", attributes:[NSAttributedStringKey.foregroundColor: UIColor.red])
            
            //if passwords doesn't match
        }else if passwordInput.text! != repeatPasswordInput.text!{
            passwordInput.attributedPlaceholder = NSAttributedString(string: "Password", attributes:[NSAttributedStringKey.foregroundColor: UIColor.red])
            repeatPasswordInput.attributedPlaceholder = NSAttributedString(string: "Repeat password", attributes:[NSAttributedStringKey.foregroundColor: UIColor.red])
            self.alertMessage.text = "Password does not match the confirm password."
            
            //if input correct => POST method to server
        }else{
            //preparing string
            let json: [String: Any] = ["email": "\(String(describing: emailInput.text))", "password": "\(String(describing: passwordInput.text))"]
            
            //send request to the server
            postMethod(json: json)
        }
        
    }
    
    func postMethod(json: [String: Any]){
    do {
        //preparing JSON odject
    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    
        // create post request
    let url = URL(string: "https://storage-application.herokuapp.com/api/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
    
        }
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
