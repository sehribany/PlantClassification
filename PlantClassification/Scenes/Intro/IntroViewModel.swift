//
//  IntroViewModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 21.02.2024.
//

import Foundation
import UIKit

protocol IntroViewDataSource{
    func numberOfItemsAt(section:Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> IntroCellProtocol
}

protocol IntroViewEventSource{}

protocol IntroViewProtocol: IntroViewDataSource, IntroViewEventSource{}

final class IntroViewModel: BaseViewModel, IntroViewProtocol{
    
    private var cellItems : [IntroCellProtocol] = [IntroCellModel(image: UIImage(named: "imgIntro1") ?? UIImage(),
                                                                  titleText: localizedString("Intro.firstTitle"),
                                                                  descriptionText: localizedString("Intro.descriptionText")),
                                                   IntroCellModel(image: UIImage(named: "imgIntro2") ?? UIImage(),
                                                                titleText: localizedString("Intro.secondTitle"),
                                                                descriptionText: localizedString("Intro.descriptionText")),
                                                   IntroCellModel(image: UIImage(named: "imgIntro3") ?? UIImage(),
                                                                titleText: localizedString("Into.thirdTitle"),
                                                                descriptionText: localizedString("Intro.descriptionText"))]
    
    func numberOfItemsAt(section: Int) -> Int {
        cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> IntroCellProtocol {
        cellItems[indexPath.row]
    }
    
    func finishedIntro(){
        
    }
}


