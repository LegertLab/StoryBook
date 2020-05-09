//
//  addPhoto.swift
//  StoryBook
//
//  Created by Anastasia Legert on 25/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit


class AnyVC: UIViewController {

    func addPhoto() {

        let actionSheet = UIAlertController(title: nil,
                                            message: nil,
                                            preferredStyle: .actionSheet)

        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                        self.chooseImagePeaker(source: .camera)
                    }
                    
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                        self.chooseImagePeaker(source: .photoLibrary)
                    }
                    
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)

        present(actionSheet, animated: true)
    }
}

// MARK: Work with image
extension AnyVC {
    func chooseImagePeaker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePeaker = UIImagePickerController()
            imagePeaker.allowsEditing = true
            imagePeaker.sourceType = source
            present(imagePeaker, animated: true)
        }
    }
}
