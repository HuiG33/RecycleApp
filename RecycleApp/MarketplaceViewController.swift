//
//  MarketplaceViewController.swift
//  RecycleApp
//
//  Created by Joni Tefke on 19/04/2018.
//  Copyright © 2018 Joni Tefke. All rights reserved.
//

import UIKit

class MarketplaceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var isCategoriesTableVisible = false
    var isLocationsTableVisible = false
    var isPricesTableVisible = false
    
    @IBOutlet weak var dropDownCategories: UITableView!
    @IBOutlet weak var dropDownC: NSLayoutConstraint!
    @IBOutlet weak var categoriesButton: UIButton!
    
    @IBOutlet weak var dropDownLocations: UITableView!
    @IBOutlet weak var dropDownL: NSLayoutConstraint!
    @IBOutlet weak var locationsButton: UIButton!
    
    @IBOutlet weak var dropDownPrices: UITableView!
    @IBOutlet weak var dropDownP: NSLayoutConstraint!
    @IBOutlet weak var pricesButton: UIButton!
    
    @IBAction func selectCategory(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.5) {
            if self.isCategoriesTableVisible == false {
                self.isCategoriesTableVisible = true
                self.dropDownC.constant = 44.0 * 5.0
                self.isLocationsTableVisible = false
                self.isPricesTableVisible = false
                self.dropDownL.constant = 0
                self.dropDownP.constant = 0
            } else {
                self.isCategoriesTableVisible = false
                self.dropDownC.constant = 0
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func selectLocation(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.5) {
            if self.isLocationsTableVisible == false {
                self.isLocationsTableVisible = true
                self.dropDownL.constant = 44.0 * 5.0
                self.isCategoriesTableVisible = false
                self.isPricesTableVisible = false
                self.dropDownC.constant = 0
                self.dropDownP.constant = 0
            } else {
                self.isLocationsTableVisible = false
                self.dropDownL.constant = 0
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func selectPrice(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.5) {
            if self.isPricesTableVisible == false {
                self.isPricesTableVisible = true
                self.dropDownP.constant = 44.0 * 5.0
                self.isCategoriesTableVisible = false
                self.isLocationsTableVisible = false
                self.dropDownC.constant = 0
                self.dropDownL.constant = 0
            } else {
                self.isPricesTableVisible = false
                self.dropDownP.constant = 0
            }
            self.view.layoutIfNeeded()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell:UITableViewCell?
        
        if tableView == self.dropDownCategories {
            cell = tableView.dequeueReusableCell(withIdentifier: "categories", for: indexPath)
            
            cell?.textLabel?.text = "\(indexPath.row + 1)"
        }
        
        if tableView == self.dropDownLocations {
            cell = tableView.dequeueReusableCell(withIdentifier: "locations", for: indexPath)
            cell?.textLabel?.text = "\(indexPath.row + 1)"
        }
        
        if tableView == self.dropDownPrices {
            cell = tableView.dequeueReusableCell(withIdentifier: "prices", for: indexPath)
            cell?.textLabel?.text = "\(indexPath.row + 1)"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView == self.dropDownCategories {
            categoriesButton.setTitle("Category: \(indexPath.row + 1)", for: .normal)
        }
        
        if tableView == self.dropDownLocations {
            locationsButton.setTitle("Location: \(indexPath.row + 1)", for: .normal)
        }
        
        if tableView == self.dropDownPrices {
            pricesButton.setTitle("Price: \(indexPath.row + 1)", for: .normal)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.dropDownC.constant = 0
            self.dropDownL.constant = 0
            self.dropDownP.constant = 0
            self.isCategoriesTableVisible = false
            self.isLocationsTableVisible = false
            self.isPricesTableVisible = false
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dropDownCategories.delegate = self
        dropDownCategories.dataSource = self
        dropDownCategories.register(UITableViewCell.self, forCellReuseIdentifier: "categories")
        
        dropDownLocations.delegate = self
        dropDownLocations.dataSource = self
        dropDownLocations.register(UITableViewCell.self, forCellReuseIdentifier: "locations")
        
        dropDownPrices.delegate = self
        dropDownPrices.dataSource = self
        dropDownPrices.register(UITableViewCell.self, forCellReuseIdentifier: "prices")
        
        dropDownC.constant = 0
        dropDownL.constant = 0
        dropDownP.constant = 0
        
        
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
