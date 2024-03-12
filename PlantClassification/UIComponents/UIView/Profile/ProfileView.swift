//
//  ProfileView.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 10.03.2024.
//

import UIKit

class ProfileView: UIView {

    private let imageView: UIImageView = {
        let image         = UIImageView()
        image.image       = UIImage(named: "icUser")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let userName: UILabel = {
        let label = UILabel()
        return label
    }()
}

//MARK: -UILayout
extension ProfileView{
    private func addSubView(){
        self.addProfileImage()
        self.addProfileName()
    }
    
    private func addProfileImage(){
        addSubview(imageView)
        imageView.width(70)
        imageView.height(70)
    }
    
    private func addProfileName(){
        addSubview(userName)
    }
}
