//
//  HomeCell.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 10.03.2024.
//

import UIKit

public class HomeCell: UICollectionViewCell, ReusableView{
    static var identifier: String = "HomeCell"
    
    private let imageView: UIImageView = {
        let image         = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label           = UILabel()
        label.textColor     = .appWhiteWrite
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font          = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    weak var viewModel: HomeCellProtocol?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

//MARK: - UILayout
extension HomeCell{
    private func addSubViews(){
        addImageView()
        addLabel()
    }
    
    private func addImageView(){
        contentView.addSubview(imageView)
        imageView.leadingToSuperview()
        imageView.trailingToSuperview()
        imageView.topToSuperview()
        imageView.width(172.5)
        imageView.height(280)
    }
    
    private func addLabel(){
        contentView.addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant = 4
        titleLabel.trailingToSuperview().constant = 4
        titleLabel.topToBottom(of: imageView).constant = 5
    }
}
// MARK: - Configure and Set Localize
extension HomeCell {
    public func set(viewModel: HomeCellProtocol) {
        self.viewModel  = viewModel
        let plant       = viewModel.plant
        imageView.setImage(plant.imageURL)
        titleLabel.text = plant.commonName
    }
}
