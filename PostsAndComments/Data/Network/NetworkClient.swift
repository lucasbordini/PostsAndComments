//
//  NetworkClient.swift
//  PostsAndComments
//
//  Created by Lucas Bordini  Ribeiro de Araujo on 03/08/21.
//

import Alamofire
import Combine

protocol NetworkClient {
    func request<T: Decodable>(api: API) -> DataResponsePublisher<[T]>?
}

class ServerClient: NetworkClient {

    let session = Session()

    func request<T: Decodable>(api: API) -> DataResponsePublisher<[T]>? {
        guard var url = URL(string: Constants.Network.BaseURL) else { return nil }
        url.appendPathComponent(api.path)
        return session.request(url).publishDecodable(type: [T].self)
    }
}
