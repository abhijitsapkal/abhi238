//
//  ViewController.swift
//  QuantsappMachineTest
//
//  Created by ABHIJIT on 01/02/21.
//

import UIKit
import Kingfisher
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {    
    @IBOutlet weak var tableView: UITableView!
    var arrData = [JsonModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        JsonParse()

    }
    func JsonParse()
    {
        let url = URL(string: "https://api.androidhive.info/feed/feed.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
            do
            {
                let json = try JSON(data: data)
//                print(json)
                let feed = json["feed"]
//                print(feed)
                for arr in feed.arrayValue{
                    self.arrData.append(JsonModel(json: arr))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch
            {
                print("Error\(error.localizedDescription)")
            }
        }.resume()
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! ProductTableViewCell
        cell.lblName.text = arrData[indexPath.row].name
        cell.lblStatus.text = arrData[indexPath.row].status
        let url = URL(string: arrData[indexPath.row].profilePic)
        cell.imgLogo.kf.setImage(with: url)
        cell.lblTime.text = arrData[indexPath.row].timeStamp
        let mainImg = URL(string: arrData[indexPath.row].image ?? "")
        cell.imgMainview.kf.setImage(with: mainImg)
        
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

