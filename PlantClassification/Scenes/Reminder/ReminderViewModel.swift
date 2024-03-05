//
//  ReminderViewModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 5.03.2024.
//
import Foundation

protocol ReminderViewDataSource {
    
}

protocol ReminderViewEventSource {
   
}

protocol ReminderViewProtocol: ReminderViewDataSource, ReminderViewEventSource {
   
}

final class ReminderViewModel: BaseViewModel, ReminderViewProtocol {


}
