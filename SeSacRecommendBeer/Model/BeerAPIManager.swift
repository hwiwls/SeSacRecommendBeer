//
//  BeerAPIManager.swift
//  SeSacRecommendBeer
//
//  Created by hwijinjeong on 1/16/24.
//

import UIKit
import Alamofire

struct BeerAPIManager {
    func callRequest(number: Int, completionHandler: @escaping (String, String, String) -> Void) {
            let url = "https://api.punkapi.com/v2/beers/\(number)"
            
            AF.request(url, method: .get).responseDecodable(of: [Beer].self) { response in // 응답이 배열 형식으로 온다
                switch response.result {
                case .success(let success):
                    // arr.first의 반환 타입이 옵셔널이어서 옵셔널 바인딩이 필요
                    guard let beer = success.first else {
                        return
                    }
                    completionHandler(beer.name, beer.description, beer.image_url)
                    
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
}

