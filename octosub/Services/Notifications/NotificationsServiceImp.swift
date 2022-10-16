//
//  NotificationsServiceImp.swift
//  octosub
//
//  Created by Manuel Rodriguez Sebastian on 15/10/22.
//

import Foundation
import UserNotifications

class NotificationsServiceImp {
    private let notificationCenter = UNUserNotificationCenter.current()
    
    private func hasAuthorization() async -> Bool {
        do {
            let userAuthorizationGranted = try await notificationCenter.requestAuthorization(options: [.sound, .alert, .badge])
            return userAuthorizationGranted
        } catch {
            return false
        }
    }
    
    private func addNotification(subscription: Subscription) -> String? {
        guard let userRecordatory = subscription.userRecordatory else { return nil }
        
        let notificationIdentifier = UUID().uuidString
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: userRecordatory.timeInterval, repeats: true)
        
        let content = generateNotificationContent(subscription: subscription)
        let request = UNNotificationRequest(identifier: notificationIdentifier, content: content, trigger: trigger)
        
        notificationCenter.add(request)
        
        return notificationIdentifier
    }
    
    private func generateNotificationContent(subscription: Subscription) -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "Subscription Tracker"
        content.subtitle = subscription.notificationMessage
        content.sound = UNNotificationSound.default
        
        return content
    }
    
    private func deleteNotification(identifier: String) {
        notificationCenter.removeDeliveredNotifications(withIdentifiers: [identifier])
    }
}

extension NotificationsServiceImp: NotificationsService {
    func createRecordatory(subscription: Subscription) async throws -> String? {
        guard subscription.userRecordatory != nil else { return nil }
        
        if await hasAuthorization() {
            return addNotification(subscription: subscription)
        } else {
            throw NotificationError.permisionDenied
        }
    }
    
    func deleteRecordatory(identifier: String) {
        deleteNotification(identifier: identifier)
    }
}
