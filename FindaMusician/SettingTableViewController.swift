//
//  SettingTableViewController.swift
//  FindaMusician
//
//  Created by Ognam.Chen on 2017/3/12.
//  Copyright © 2017年 SwiftCourse. All rights reserved.
//

import UIKit
import CoreData

class SettingTableViewController: UITableViewController, UIImagePickerControllerDelegate {
    var settingMusician : FindaMusicianMO!
    
    @IBOutlet var peopleName: UITextField!
    @IBOutlet var peopleDescription: UITextView!
    @IBOutlet var peopleImage: UIImageView!
    
    
    @IBOutlet var bandName: UITextField!
    @IBOutlet var bandDescription: UITextView!
    @IBOutlet var bandImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            settingMusician = FindaMusicianMO(context: appDelegate.persistentContainer.viewContext)
            settingMusician.peopleName = peopleName.text
            settingMusician.peopleDescription = peopleDescription.text
            if let peopleImageData = UIImagePNGRepresentation(peopleImage.image!) {
                settingMusician.peopleImage = NSData(data: peopleImageData)
            }
            settingMusician.bandName = bandName.text
            settingMusician.bandDescription = bandDescription.text
            if let bandImageData = UIImagePNGRepresentation(bandImage.image!) {
                settingMusician.bandImage = NSData(data: bandImageData)
            }
            appDelegate.saveContext()
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            peopleImage.image = selectImage
            peopleImage.contentMode = .scaleAspectFit
            bandImage.image = selectImage
            bandImage.contentMode = .scaleAspectFit
            
        }
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func peopleImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true, completion: nil)
            
        }
        
    }
    @IBAction func bandImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
            present(imagePicker, animated: true, completion: nil)
            
        }
    }
}

