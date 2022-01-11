//
//  ViewController.swift
//  Local notificaiton demo
//
//  Created by Ashish Pisey on 16/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showLocalNotfication()
    }
    
    func showLocalNotfication() {
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!", arguments: nil)
        content.sound = UNNotificationSound.default
        
        // Configure the trigger for a 7am wakeup.
        let currentDate = Date(timeIntervalSinceNow: 5)
        
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: currentDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
         
        // Create the request object.
        let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
         
        // Schedule the request.
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        center.add(request) { (error : Error?) in
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
    }


}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // notification arrived
        // this will be executed when app is open
        showAlert()
        print("will present notification")
        completionHandler(UNNotificationPresentationOptions.sound)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        // notification clicked or opened
        // this will be executed only when app is minimised
        showAlert()
        print("did receive notification")
    }
    
    func removeAllNotifications() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [])
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func showAlert() {
        let alertVC = UIAlertController.init(title: "Alarm", message: "Local notification received", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

