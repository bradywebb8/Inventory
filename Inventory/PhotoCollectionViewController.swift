//
//  PhotoCollectionViewController.swift
//  Inventory
//
//  Created by Brady Webb on 11/8/19.
//  Copyright © 2019 Brady Webb. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UIViewController {
    @IBOutlet weak var displayTextView: UITextView!
    
    let jsonFileName = "photos"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photoCollection = PhotoCollectionLoader.load(jsonFileName: jsonFileName) {
            var displayInfo = ""
            displayInfo += "Status: \(photoCollection.status)\n"
            displayInfo += "Photos path: \(photoCollection.photosPath)\n\n"
            for photo in photoCollection.photos {
                displayInfo += "Photo:\n"
                displayInfo += "\(photo.title)\n"
                displayInfo += "\(photo.description)\n"
                displayInfo += "\(photo.date)\n"
                displayInfo += "\(photo.latitude)\n"
                displayInfo += "\(photo.longitude)\n"
                displayInfo += "\(photo.image)\n\n"
            }
            displayTextView.text = displayInfo
        } else {
            displayTextView.text = "Error."
        }
    }
}
