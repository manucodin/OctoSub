//
//  SubcriptionServicesServiceImp.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation
import Firebase

class SubcriptionServicesServiceImp {
    private let database = Firestore.firestore()
}

extension SubcriptionServicesServiceImp: SubcriptionServicesService {
    func fetchSubscriptionServices() async -> [SubscriptionService] {
        let documents = try? await database.collection("services").getDocuments().documents
        let servicesDTO = documents?.compactMap{ document -> SubscriptionServiceDTO? in
            return try? document.data(as: SubscriptionServiceDTO.self)
        } ?? []
        
        let services = servicesDTO.compactMap(SubscriptionServiceDTOMapper.transform)
        return services
    }
}
