//
//  BottomSheetCategoryViewController.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import UIKit

class BottomSheetCategoryViewController: UIViewController {
    
    typealias NextButtonTapClosure = (String) -> Void
    
    @IBOutlet weak var tableView: UITableView!
    
    private var bottomSheetTitleTableViewCell: BottomSheetTitleTableViewCell!
    
    
    private var onSelectCategory: NextButtonTapClosure = { _ in
        //Nothing to do!?
    }
    
    class func create() -> BottomSheetCategoryViewController {
        let storyboard = UIStoryboard(name: "BottomSheet", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "BottomSheet")  as! BottomSheetCategoryViewController
    }
    
    private var categoryList = ["Popular", "Upcoming", "Top Rated", "Now Playing"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func set(onSelectCategory: @escaping NextButtonTapClosure) {
        self.onSelectCategory = onSelectCategory
    }
    
    private func setupTable() {
        tableView.estimatedRowHeight = 30
        tableView.rowHeight = UITableView.automaticDimension
    }
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
        var movieType = ""
        switch indexPath.row {
        case 1:
            movieType = "upcoming"
        case 2:
            movieType = "top_rated"
        case 3:
            movieType = "now_playing"
        default:
            movieType = "popular"
        }
        onSelectCategory(movieType)
        dismiss(animated: true, completion: nil )
    }
    
}
