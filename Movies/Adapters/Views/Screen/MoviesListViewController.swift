//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import UIKit
import RxSwift
import MaterialComponents.MaterialBottomSheet

class MoviesListViewController: UIViewController {

    @IBOutlet weak var moviesListTableView: UITableView!
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    @IBOutlet weak var categoryButton: UIButton!
    
    var moviesListViewModel: MoviesListViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCellNib()
        setupEvent()
        setupTable()
        moviesListViewModel.viewDidLoad()
        self.title = "Movies"

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openMoviesDetailPage" {
            guard let destinationViewController = segue.destination as? MovieDetailViewController, let movieViewParam = sender as? MovieViewParams else { return }
            destinationViewController.setMovieAndTitle(movieId: movieViewParam.id, title: movieViewParam.title)
        }
    }
    
    @IBAction func fovouriteButtonAction(_ sender: Any) {
        
    }
    
    private func setupTable() {
        moviesListTableView.estimatedRowHeight = 300
        moviesListTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupEvent() {
        moviesListViewModel.rxEventLoadMovies
            .subscribe(onNext: { [weak self] in
                self?.moviesListTableView.reloadData()
            }).disposed(by: disposeBag)
        
        moviesListViewModel.rxEventOpenMoviesDetail
            .subscribe(onNext: { [weak self] movieViewParams in
                self?.openMovieDetail(movieViewParams: movieViewParams)
            }).disposed(by: disposeBag)
    }
    
    private func openMovieDetail(movieViewParams: MovieViewParams) {
        performSegue(withIdentifier: "openMoviesDetailPage", sender: movieViewParams)
    }
    
    private func registerTableViewCellNib() {
        moviesListTableView.register(MoviesTableViewCell.nib(), forCellReuseIdentifier: MoviesTableViewCell.cellReuseIdentifier())
    }

    @IBAction func categoryButtonAction(_ sender: Any) {
        let bottomSheetViewController = BottomSheetCategoryViewController.create()
        bottomSheetViewController.set { path in
            self.moviesListViewModel.getMovies(path: path)
        }
        let mdcBottomSheetController = MDCBottomSheetController(contentViewController: bottomSheetViewController)
        mdcBottomSheetController.view.frame =  CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120)
        mdcBottomSheetController.trackingScrollView = bottomSheetViewController.tableView
        mdcBottomSheetController.scrimColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        DispatchQueue.main.async {
            self.navigationController?.present(mdcBottomSheetController, animated: true, completion: nil)
        }
    }
}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesListViewModel.moviesViewParam.movieList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moviesCell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.cellReuseIdentifier()) as! MoviesTableViewCell
        moviesCell.setupUI(movieViewParam: moviesListViewModel.moviesViewParam.movieList[indexPath.row])
        return moviesCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesListViewModel.openMoviesDetail(index: indexPath.row)
    }
}

