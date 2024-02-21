//
//  IntroViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 21.02.2024.
//

import UIKit

final class IntroViewController: BaseViewController<IntroViewModel> {
    
    private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.tintColor = .blue
        pageControl.pageIndicatorTintColor = .appWhite
        pageControl.currentPageIndicatorTintColor = .appSplashGreen
        pageControl.numberOfPages = 3
        return pageControl
    }()
    
    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        return button
        
    }()
    
    private var collectionView: UICollectionView = {
        let layout                     = UICollectionViewFlowLayout()
        layout.scrollDirection         = .horizontal
        let collectionView             = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(IntroCell.self, forCellWithReuseIdentifier: IntroCell.identifier)
        collectionView.showsVerticalScrollIndicator   = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        contentConfigure()
    }
}
//MARK: UILayout
extension IntroViewController{
    private func addSubView(){
        addPageControl()
        addNextButton()
        addCollectionView()
    }
    
    private func addPageControl(){
        view.addSubview(pageControl)
        pageControl.leadingToSuperview().constant = 10
        pageControl.bottom(to: view, offset: -70)
    }
    
    private func addNextButton(){
        view.addSubview(nextButton)
        nextButton.bottomToSuperview().constant = -70
        nextButton.trailingToSuperview().constant = -10
    }
    
    private func addCollectionView(){
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .bottom)
        collectionView.bottomToSuperview().constant = -85
        //collectionView.trailingToSuperview()
        //collectionView.leadingToSuperview()
        //ollectionView.

    }
}
//MARK: -Configuration
extension IntroViewController{
    private func contentConfigure(){
        view.backgroundColor = .magenta
        collectionView.delegate = self
        collectionView.dataSource = self
        pageControl.isUserInteractionEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.setTitle(localizedString("Intro.Next"), for: .normal)
    }
}

//MARK: - UICollectionViewDataSource
extension IntroViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroCell.identifier, for: indexPath) as! IntroCell
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension IntroViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / witdh)
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            nextButton.setTitle(localizedString("Intro.Start"), for: .normal)
        } else {
            nextButton.setTitle(localizedString("Intro.Next"), for: .normal)
        }
    }
}

// MARK: -Actions
extension IntroViewController {
    @objc
    private func nextButtonTapped() {
        if pageControl.currentPage == viewModel.numberOfItemsAt(section: 0) - 1 {
            viewModel.finishedIntro()
        } else {
            pageControl.currentPage += 1
            let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
