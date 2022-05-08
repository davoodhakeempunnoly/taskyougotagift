//
//  ViewController.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let provider = ServiceProvider<GetListService>()
    private lazy var listViewModel: ListingViewModel = {
        return ListingViewModel(serviceProvider: provider)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        // Do any additional setup after loading the view.
    }
    func setupViewModel() {
        listViewModel.initialDataResponse.bind { _ in
            self.tableView.reloadData()
        }
        listViewModel.loadingIndicatorStatus.bind { isEnabled in
            if isEnabled {
                Utility.showLoader(self.view)
                return
            }
            Utility.hideLoader(self.view)
        }
        listViewModel.getList(isInitialLoad: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.getListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        if let item = listViewModel.getItem(index: indexPath.row) {
            cell.item = item
        }
        if indexPath.row == listViewModel.getListCount() - 1 {
            listViewModel.getList(isInitialLoad: false)
        }
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = listViewModel.getItem(index: indexPath.row) {
            listViewModel.setSelectedItem(item)
            self.performSegue(withIdentifier: "details", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailsViewController {
            destinationVC.listViewModel = listViewModel
        }
    }
}
