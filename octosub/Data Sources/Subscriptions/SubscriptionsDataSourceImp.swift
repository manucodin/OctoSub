//
//  SubscriptionsDataSourceImp.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 29/9/22.
//

import Foundation

class SubscriptionsDataSourceImp {
    private let dao: SubscriptionDAO
    private let notificationsService: NotificationsService
    private let countDownService: SubscriptionCountdownService
    
    init(dao: SubscriptionDAO = SubscriptionDAOImp(), notificationsService: NotificationsService = NotificationsServiceImp(), countDownService: SubscriptionCountdownService = SubscriptionCountdownServiceImp()) {
        self.dao = dao
        self.notificationsService = notificationsService
        self.countDownService = countDownService
    }
}

extension SubscriptionsDataSourceImp: SubscriptionsDataSource {
    
    @MainActor
    func save(subscription: Subscription) async throws {
        let notificationIdentifier = try await notificationsService.createRecordatory(subscription: subscription)
        let entity = SubscriptionEntityMapper.transform(subscription: subscription.updating(notificationIdentifier))
        try dao.save(entity: entity)
        countDownService.createCountDown(subscription: subscription)
    }
    
    func getAll() -> [Subscription] {
        let subscripionEntities = dao.getAll()
        let subscriptions = subscripionEntities.compactMap(SubscriptionEntityMapper.transform)
        
        return subscriptions
    }
    
    @MainActor
    func remove(subscription: Subscription) async throws {
        guard let entity = dao.get(identifier: subscription.id) else { return }
        
        if let notificationIdentifier = entity.notificationIdentifier {
            notificationsService.deleteRecordatory(identifier: notificationIdentifier)
        }
        
        try dao.remove(entity: entity)
    }
}
