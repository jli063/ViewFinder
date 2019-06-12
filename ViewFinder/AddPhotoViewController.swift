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
    
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var captionText: UITextField!
    @IBAction func savePhoto(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            photoToSave.caption = captionText.text
        if let userImage = newImage.image {
            if let userImageData = userImage.pngData() {
                photoToSave.imageData = userImageData
            }
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    
        func chooseLibrary(_ sender: Any) {
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
    }
    
        func chooseAlbum(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        newImage.image = selectedImage
        }
    imagePicker.dismiss(animated:true, completion:nil)
    }
}
}
