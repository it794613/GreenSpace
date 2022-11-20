//
//  RequestInterceptor.swift
//  GreenSpace
//
//  Created by su on 2022/11/20.
//

import Foundation
import Alamofire

final class MyRequestInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let accessToken = Auth.shared.access else {
                  completion(.success(urlRequest))
                  return
              }

        var urlRequest = urlRequest
        print(accessToken)
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        print("interceptor!")
        completion(.success(urlRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }

        /* TODO:
        RefreshTokenAPI.refreshToken { result in
            switch result {
            case .success(let accessToken):
                KeychainServiceImpl.shared.accessToken = accessToken
                completion(.retry)
            case .failure(let error):
                completion(.doNotRetryWithError(error))
            }
        }
        */
    }
}
