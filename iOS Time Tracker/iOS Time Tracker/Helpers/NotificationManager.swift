//
//  NotificationManager.swift
//  iOS Time Tracker
//
//  Created by Ashish Pisey on 21/12/21.
//

import Foundation
import UserNotifications

class NotificationManager {
    class func getNotificationRequest(tracker:Tracker) -> UNNotificationRequest {
        let content = UNMutableNotificationContent()
        content.title = tracker.topicName
        content.body = "You have studied for \(tracker.timerDisplayValue). Take a break"
        
        // trigger
        // Configure the trigger for a 7am wakeup.
        let timeInterval = TimeInterval.init(tracker.timeInterval)
        
        let triggerTime = Date(timeIntervalSinceNow: timeInterval)
        
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: triggerTime)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
         
        // Create the request object.
        let request = UNNotificationRequest(identifier: tracker.topicName, content: content, trigger: trigger)
         
        return request
        
    }
    
    func cancelNotification() {
        
    }
    
    class func askUserPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
//        let action = UNNotificationAction.init(identifier: "id", title: "action1", options: .foreground)
//        let category = UNNotificationCategory.init(identifier: "categoryID", actions: [action], intentIdentifiers: ["id1"], options: UNNotificationCategoryOptions.allowInCarPlay)
//        notificationCenter.setNotificationCategories([category])
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { isAllowed, error in
            
        }
    }
}
