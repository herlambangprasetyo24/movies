//
//  ApiClent.swift
//  Movies
//
//  Created by Herlambang Prasetyo on 16/07/20.
//  Copyright © 2020 Herlambang. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire


protocol ApiClientProtocol {
    func getString(url: String) -> Single<(Bool, String)>
}

class ApiClient: ApiClientProtocol {

    private let configuration = URLSessionConfiguration.default

    private static let successResponseCode = 200
    private static let sessionExpiredResponseCode = 401
    
    func getString(url: String) -> Single<(Bool, String)> {
        return doRequest(url: url, method: .get)
    }
    
    private func doRequest(url: String, method: Alamofire.HTTPMethod, withJSONEndcoding: Bool = false) -> Single<(Bool, String)> {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let manager = SessionManager.default
        return Single.create { [weak self] single in
            guard let weakSelf = self else { return Disposables.create() }
            return manager.rx.request(method, url, encoding: withJSONEndcoding ? JSONEncoding.default : URLEncoding.default)
                .flatMap { alamofireRequest in
                    alamofireRequest.rx.responseString()
            }.subscribe(onNext: { (response, string) in
//                UIApplication.shared.isNetworkActivityIndicatorVisible = false
//                if response.statusCode == SweetEscapeApiClient.sessionExpiredResponseCode {
//                    AppUtil.getAppDelegate()?.appScreenViewModel.doForceLogout()
//                }
                single(.success((response.statusCode == 200, string)))
            }, onError: { error in
                single(.error(error))
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            })
        }
    }
    
}
