//
//  MyStorageCollectionViewController.swift
//  RecycleApp
//
//  Created by Joni Tefke on 19/04/2018.
//  Copyright © 2018 Joni Tefke. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyStorageCollectionViewController: UICollectionViewController {

    let myItems: [String] = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    
    var selectedItemLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return myItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyStorageCollectionViewCell
    
        // Configure the cell
        
        //cell.myLabel.text = myItems[indexPath.item]
        
        cell.displayContent(image: #imageLiteral(resourceName: "defaultItem"), title: myItems[indexPath.item])
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItemLabel = myItems[indexPath.item]
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SIVC = mainStoryBoard.instantiateViewController(withIdentifier: "singleItem") as! SingleItemViewController
        SIVC.itemLabel = selectedItemLabel
        SIVC.itemImage = #imageLiteral(resourceName: "defaultItem")
        self.navigationController?.pushViewController(SIVC, animated: true)
    }
}
