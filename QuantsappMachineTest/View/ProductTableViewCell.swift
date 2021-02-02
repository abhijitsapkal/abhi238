//
//  ProductTableViewCell.swift
//  QuantsappMachineTest
//
//  Created by ABHIJIT on 01/02/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMainview: UIImageView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
