//
//  IntroCell.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 21.02.2024.
//

import UIKit

class IntroCell: UICollectionViewCell, ReusableView {
    static var identifier: String = "IntroCell"
    
    private let imageView: UIImageView = {
        let image         = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label           = UILabel()
        label.textColor     = .appWhiteWrite
        label.textAlignment = .left
        label.numberOfLines = 3
        label.font          = UIFont.boldSystemFont(ofSize: 52)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label           = UILabel()
        label.textColor     = .appWhiteWrite
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font          = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    weak var viewModel: IntroCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(viewModel: IntroCellProtocol){
        self.viewModel        = viewModel
        imageView.image       = viewModel.image
        titleLabel.text       = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
    }
}

//MARK: -IULayout
extension IntroCell{
    private func addSubViews(){
        addImageView()
        addTitleLabel()
        addDescriptionLabel()
    }
    
    private func addImageView(){
        contentView.addSubview(imageView)
        imageView.edgesToSuperview()
    }
    
    private func addTitleLabel(){
        contentView.addSubview(titleLabel)
        titleLabel.leadingToSuperview().constant  = 20
        titleLabel.trailingToSuperview().constant = -30
        titleLabel.topToSuperview().constant      = 350
    }
    
    private func addDescriptionLabel(){
        contentView.addSubview(descriptionLabel)
        descriptionLabel.leadingToSuperview().constant        = 20
        descriptionLabel.trailingToSuperview().constant       = -15
        descriptionLabel.topToBottom(of: titleLabel).constant = 20
    }
}
