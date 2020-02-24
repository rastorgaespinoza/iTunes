//
//  SearchInteractor.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 19-02-20.
//  Copyright (c) 2020 Rodrigo Astorga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchBusinessLogic
{
    func fetchSearch(request: Search.FetchSearch.Request)
}

protocol SearchDataStore
{
    var mediaResult: [MediaResult]? { get set }
}

class SearchInteractor: SearchBusinessLogic, SearchDataStore
{
  var presenter: SearchPresentationLogic?
  var worker: SearchWorker?
  var mediaResult: [MediaResult]?

  func fetchSearch(request: Search.FetchSearch.Request)
  {
    worker = SearchWorker()
    worker?.fetchSearch(searchString: request.searchString, completionHandler: { (mediaResult: [MediaResult]?, error: SearchError?) in
        guard error == nil else {
            print(error!)
            self.presenter?.presentError(responseError: error!)
            return
        }
        let response = Search.FetchSearch.Response(media: mediaResult ?? [MediaResult]())
        self.mediaResult = mediaResult
        self.presenter?.presentFetchedSearch(response: response)
    })
  }
}
