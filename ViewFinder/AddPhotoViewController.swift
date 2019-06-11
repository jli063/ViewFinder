//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 6/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController,
                              UIImagePickerControllerDelegate,
                            UINavigationControllerDelegate{
var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            super.viewDidLoad()
            imagePicker.delegate = self
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func chooseLibrary(_ sender: Any) {
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func chooseAlbum(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var newImage: UIImageView!

    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        newImage.image = selectedImage
        }
    imagePicker.dismiss(animated:true, completion:nil)
    }
}
