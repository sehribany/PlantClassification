//
//  BaseViewModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 19.02.2024.
//

protocol BaseViewDataSource: AnyObject {}

protocol BaseViewEventSource: AnyObject {
    var showActivityIndicatorView: (() -> Void)? { get set }
    var hideActivityIndicatorView: (() -> Void)? { get set }
    var showLoading              : (() -> Void)? { get set }
    var hideLoading              : (() -> Void)? { get set }
    var showWarningToast         : ((String) -> Void)? { get set }
}

protocol BaseViewProtocol: BaseViewDataSource, BaseViewEventSource {}

class BaseViewModel: BaseViewProtocol {
    
    var showActivityIndicatorView: (() -> Void)?
    var hideActivityIndicatorView: (() -> Void)?
    var showLoading              : (() -> Void)?
    var hideLoading              : (() -> Void)?
    var showWarningToast         : ((String) -> Void)?
    
}
