//
//  HomeViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 5.03.2024.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let searchBar: UISearchBar = {
        let searchBar             = UISearchBar()
        searchBar.backgroundColor = .appGreenLight
        searchBar.placeholder     = "Search Plant"
        return searchBar
    }()
    
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
        viewModel.fetchPlants(page: viewModel.page)
        subscribeViewModelEvents()
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
        addSearchBar()
        addCollectionView()
    }
    
    private func addSearchBar(){
        view.addSubview(searchBar)
        searchBar.topToSuperview().constant      = 92
        searchBar.leadingToSuperview().constant  = 0
        searchBar.trailingToSuperview().constant = 0
    }
    
    private func addCollectionView(){
        view.addSubview(collectionView)
        collectionView.topToBottom(of: searchBar)
        collectionView.edgesToSuperview(excluding: .top)
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK: - Configure and Set Localize
extension HomeViewController{
    
    private func configureContents() {
        collectionView.backgroundColor = .appWhite
        searchBar.delegate        = self
        collectionView.delegate   = self
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
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.backgroundColor = .red
        cell.set(viewModel: cellItem)
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2
        let height: CGFloat = 320
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
// MARK: -UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchSearch(searchTitle: searchText)
    }
}
// MARK: - UIScrollViewDelegate
extension HomeViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            viewModel.fetchMorePages()
        }
    }
}
