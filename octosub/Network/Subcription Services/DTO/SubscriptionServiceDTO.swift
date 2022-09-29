//
//  SubscriptionServiceDTO.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation
import FirebaseFirestoreSwift

struct SubscriptionServiceDTO: Codable {
    @DocumentID var id: String?
    let name: String
    let category: String
    let icon: String
    let color: String
}
