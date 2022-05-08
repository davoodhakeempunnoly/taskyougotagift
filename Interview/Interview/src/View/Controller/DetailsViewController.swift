//
//  DetailsViewController.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var newsImageVIew: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    weak var listViewModel: ListingViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDetails()
        // Do any additional setup after loading the view.
    }
    
    func populateDetails() {
        let item = listViewModel?.getSelectedItem()
        newsDescription.text = item?.snippet
        newsTitle.text = item?.headline?.main
        if let imageUrl = item?.multimedia, imageUrl.count > 0 {
            newsImageVIew.sd_setImage(with: URL(string: ApiConstants.imageBaseUrl + imageUrl[0].url!), placeholderImage: UIImage(named: "placeholderNews"))
        }
    }
}
