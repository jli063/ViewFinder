//
//  PhotoTableViewController.swift
//  ViewFinder
//
//  Created by Apple on 6/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    var photos : [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func getPhotos() {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataPhotos = try? context.fetch(Photos.fetchRequest()) as? [Photos] {
                photos = coreDataPhotos
                tableView.reloadData()
            }
            // now we need to search through Core Data to find our photos/captions
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getPhotos()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellPhoto = photos[indexPath.row]
        cell.textLabel?.text = cellPhoto.caption
        if let cellPhotoImageData = cellPhoto.imageData {
            if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                cell.imageView?.image = cellPhotoImage
            }
        }
        
        return cell
}
}
