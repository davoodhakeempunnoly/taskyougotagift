//
//  ListTableViewCell.swift
//  Interview
//
//  Created by Davoodul Hakeem on 07/05/22.
//


import UIKit
import SDWebImage
class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsHeading: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var snippestLabel: UILabel!
    var item: DocsModel! {
           didSet {
               snippestLabel.text = item.snippet
               dateLabel.text = item.pub_date
               newsHeading.text = item.headline?.main
               if let imageUrl = item.multimedia, imageUrl.count > 0 {
                   newsImageView.sd_setImage(with: URL(string: ApiConstants.imageBaseUrl + imageUrl[0].url!), placeholderImage: UIImage(named: "placeholderNews"))
               } else {
                   newsImageView.image = UIImage(named: "placeholderNews")
               }
           }
       }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
