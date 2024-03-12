//
//  HomeViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 5.03.2024.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let collectionView: UICollectionView = {
        let layout         = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        fetch()
        subscribeViewModelEvents()
    }
    
    private func fetch(){
        viewModel.fetchPlants { error in
            if let error = error {
                print("Hata oluştu: \(error)")
            }
        }
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchPlants = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}
//MARK: -UILayout
extension HomeViewController{
    private func addSubViews(){
        addCollectionView()
    }
    
    private func addCollectionView(){
        view.addSubview(collectionView)
        collectionView.edgesToSuperview()
    }
}

// MARK: - Configure and Set Localize
extension HomeViewController{
    
    private func configureContents() {
        collectionView.backgroundColor = .appWhite
        collectionView.delegate = self
        collectionView.dataSource = self
        addNavigationBarLogo()
        view.backgroundColor = .appWhite
        self.addSettingsButton()
    }
    
    private func addSettingsButton() {
        let settingsButton = UIBarButtonItem(image: UIImage(named: "icSettings"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = settingsButton
    }

    @objc private func settingsButtonTapped() {
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
}
// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15 
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width + 145 )
    }
}
