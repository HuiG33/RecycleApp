//
//  AddItemViewController.swift
//  RecycleApp
//
//  Created by Joni Tefke on 18/04/2018.
//  Copyright © 2018 Joni Tefke. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var saveItem: UIButton!
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBAction func takePicture(_ sender: UIButton) {
        
        let image = UIImagePickerController()
        image.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                image.sourceType = .camera
                self.present(image, animated: true, completion: nil)
            } else {
                print("No available camera")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Library", style: .default, handler: { (action:UIAlertAction) in
            image.sourceType = .photoLibrary
            self.present(image, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            selectedImage.image = image
            updateSaveButtonState()
        }
        else
        {
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveItem.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        
    }
    
    func updateSaveButtonState() {
        let image = selectedImage.image ?? nil
        let text = itemName.text ?? ""
        
        if image == nil || text.isEmpty{
            saveItem.isEnabled = false
        } else {
            saveItem.isEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemName.delegate = self
        
        updateSaveButtonState()
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
