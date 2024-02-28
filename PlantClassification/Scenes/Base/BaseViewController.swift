//
//  BaseViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 19.02.2024.
//

import UIKit
import TinyConstraints

class BaseViewController<V: BaseViewProtocol>: UIViewController {

    var viewModel: V
    
    init(viewModel: V){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - NavigationBar Logo
extension BaseViewController {
    func addNavigationBarLogo() {
        let image = UIImage(named: "imgNavLogo")
        let imageView = UIImageView()
        imageView.size(CGSize(width: 100, height: 40))
        imageView.contentMode    = .scaleAspectFit
        imageView.image          = image
        navigationItem.titleView = imageView
    }
}
