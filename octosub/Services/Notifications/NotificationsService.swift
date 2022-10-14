//
//  NotificationsService.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 15/10/22.
//

import Foundation

protocol NotificationsService {
    func createRecordatory(subscription: Subscription) async throws -> String?
    func deleteRecordatory(identifier: String)
}
