//
//  SearchController.swift
//  SNASA
//
//  Created by Nebo on 23.09.2023.
//

import UIKit

protocol SearchControllerProtocol: AnyObject {
    
}

class SearchController: BaseViewController<SearchView>, SearchControllerProtocol {
    
    var presenter: SearchPresenterProtocol?
    
}
