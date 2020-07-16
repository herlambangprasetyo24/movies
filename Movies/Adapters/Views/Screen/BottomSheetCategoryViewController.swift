//
//  BottomSheetCategoryViewController.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import UIKit

class BottomSheetCategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var bottomSheetTitleTableViewCell: BottomSheetTitleTableViewCell!
    
    class func create() -> BottomSheetCategoryViewController {
        let storyboard = UIStoryboard(name: "BottomSheet", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "BottomSheet")  as! BottomSheetCategoryViewController
    }
    
    private var categoryList = ["Popular", "Upcoming", "Top Rated", "Now Playing"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    private func setupTable() {
        tableView.estimatedRowHeight = 30
        tableView.rowHeight = UITableView.automaticDimension
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BottomSheetCategoryViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bottomSheetTitleTableViewCell", for: indexPath)
        cell.textLabel?.text = categoryList[indexPath.row]
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
