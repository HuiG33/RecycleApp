//
//  MyStorageCollectionViewCell.swift
//  RecycleApp
//
//  Created by Joni Tefke on 19/04/2018.
//  Copyright © 2018 Joni Tefke. All rights reserved.
//

import UIKit

class MyStorageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    func displayContent(image: UIImage, title: String) {
        myImage.image = image
        myLabel.text = title
    }
}
