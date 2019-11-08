//
//  PhotoSetViewController.swift
//  Inventory
//
//  Created by Brady Webb on 11/8/19.
//  Copyright © 2019 Brady Webb. All rights reserved.
//

import UIKit

class PhotoSetViewController: UIViewController {
    @IBOutlet weak var displayTextView: UITextView!
    
    let jsonFileName = "photos"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photoSet = PhotoSetLoader.load(jsonFileName: jsonFileName) {
            var displayInfo = ""
            displayInfo += "Status: \(photoSet.status)\n"
            displayInfo += "Photos path: \(photoSet.photosPath)\n\n"
            for photo in photoSet.photos {
                displayInfo += "Photo:\n"
                displayInfo += "\(photo.title)\n"
                displayInfo += "\(photo.description)\n"
                displayInfo += "\(photo.date)\n"
                displayInfo += "\(photo.latitude)\n"
                displayInfo += "\(photo.longitude)\n"
                displayInfo += "\(photo.imageName)\n\n"
            }
            displayTextView.text = displayInfo
        } else {
            displayTextView.text = "Error."
        }
    }
}


