//
//  ListingViewModel.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//


import UIKit

class ListingViewModel: NSObject {
    weak var serviceProvider: ServiceProvider<GetListService>?
    let initialDataResponse: ObjectBinder<[DocsModel]?> = ObjectBinder(nil)
    let loadingIndicatorStatus: ObjectBinder<Bool> = ObjectBinder(false)
    var pageNumber: Int = 0
    var selectedItem: DocsModel?
    init(serviceProvider: ServiceProvider<GetListService>) {
        self.serviceProvider = serviceProvider
    }
    
    /// Api call  to getting the news list
    /// - Parameter isInitialLoad: to handle the pagination
    func getList(isInitialLoad: Bool = false) {
        pageNumber = isInitialLoad ? 0 : pageNumber + 1
        loadingIndicatorStatus.value = true
        serviceProvider?.load(
            service: .newsList("\(pageNumber)"), decodeType: ListResponseModel.self, completion: { [weak self] (result) in
                self?.loadingIndicatorStatus.value = false
            switch result {
            case .success(let list):
                let listResponse = list
                if let docsR = listResponse.response?.docs {
                    if isInitialLoad {
                        self?.initialDataResponse.value = docsR
                    } else {
                        self?.initialDataResponse.value?.append(contentsOf: docsR)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            case .empty:
                print("Empty Data")
            }
        })
    }
    
    /// getting news list count
    /// - Returns: Number of news
    func getListCount() -> Int {
        return initialDataResponse.value?.count ?? 0
    }
    
    /// Get item
    /// - Parameter index: table index
    /// - Returns: News item for the cell
    func getItem(index: Int) -> DocsModel? {
        if let item = initialDataResponse.value?[index] {
            return item
        }
        return nil
    }
    
    /// saving selected news
    /// - Parameter item: selected item
    func setSelectedItem(_ item :DocsModel) {
        selectedItem = item
    }
    
    /// returning selected item
    /// - Returns: selected item
    func getSelectedItem() -> DocsModel? {
        return selectedItem
    }
}
