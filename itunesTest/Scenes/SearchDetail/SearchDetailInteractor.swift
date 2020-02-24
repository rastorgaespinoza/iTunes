//
//  SearchDetailInteractor.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 23-02-20.
//  Copyright (c) 2020 Rodrigo Astorga. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchDetailBusinessLogic
{
  func doSomething(request: SearchDetail.FetchDetail.Request)
}

protocol SearchDetailDataStore
{
  var media: MediaResult? { get set }
}

class SearchDetailInteractor: SearchDetailBusinessLogic, SearchDetailDataStore
{
  var presenter: SearchDetailPresentationLogic?
  var worker: SearchDetailWorker?
  var media: MediaResult?// = ""
  
  // MARK: Do something
  
  func doSomething(request: SearchDetail.FetchDetail.Request)
  {
    worker = SearchDetailWorker()
    worker?.doSomeWork()
    
    let response = SearchDetail.FetchDetail.Response()
    presenter?.presentDetailSearch(response: response)
  }
}
