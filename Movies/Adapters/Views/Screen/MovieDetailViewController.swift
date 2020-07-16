//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import UIKit
import RxSwift

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieDetailTableView: UITableView!
    
    var movieDetailViewModel: MovieDetailViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        registerTableViewCellNib()
        setupViewModel()
        movieDetailViewModel.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setMovieAndTitle(movieId: Int, title: String) {
        movieDetailViewModel.setMovieId(movieId: movieId)
        
        self.title = title
    }
    
    private func createHeaderView(title: String) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 8, width: 0, height: 0))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.text = title.capitalized
        headerView.backgroundColor = .lightGray
        titleLabel.sizeToFit()
        headerView.addSubview(titleLabel)
        return headerView
    }
    
    private func setupViewModel() {
        movieDetailViewModel.rxEventLoadMovieDetail
            .subscribe(onNext: { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.movieDetailTableView.reloadData()
            }).disposed(by: disposeBag)
        
        movieDetailViewModel.rxEventUpdateFavouriteButton
            .subscribe(onNext: { [weak self] isFavourite in
                guard let weakSelf = self else { return }
                weakSelf.movieDetailTableView.reloadData()
            }).disposed(by: disposeBag)
        
    }
    
    private func setupTable() {
        movieDetailTableView.estimatedRowHeight = 50
        movieDetailTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func registerTableViewCellNib() {
        movieDetailTableView.register(MoviesInformationTableViewCell.nib(), forCellReuseIdentifier: MoviesInformationTableViewCell.cellReuseIdentifier())
        movieDetailTableView.register(MovieReviewTableViewCell.nib(), forCellReuseIdentifier: MovieReviewTableViewCell.cellReuseIdentifier())
    }

}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if movieDetailViewModel.movieReviewViewParams.results.isEmpty {
            return 1
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return movieDetailViewModel.movieReviewViewParams.results.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let moviesCell = tableView.dequeueReusableCell(withIdentifier: MoviesInformationTableViewCell.cellReuseIdentifier()) as! MoviesInformationTableViewCell
            moviesCell.setupUI(movieDetailViewParams: movieDetailViewModel.movieDetailViewParams)
            moviesCell.set(onSelectFavouriteMovie: { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.movieDetailViewModel.manageFavouriteButton()
            })
            return moviesCell
        } else if indexPath.section == 1 {
            let movieReviewTableViewCell = tableView.dequeueReusableCell(withIdentifier: MovieReviewTableViewCell.cellReuseIdentifier()) as! MovieReviewTableViewCell
            let reviewResult = movieDetailViewModel.movieReviewViewParams.results[indexPath.row]
            movieReviewTableViewCell.setupUI(author: reviewResult.author, review: reviewResult.content)
            return movieReviewTableViewCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return createHeaderView(title: "Review")
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 40
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
