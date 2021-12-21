//
//  TrackerVC.swift
//  iOS Time Tracker
//
//  Created by Ashish Pisey on 21/12/21.
//

import UIKit

class TrackerVC: UIViewController {

    @IBOutlet weak var lblTopic: UILabel!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblTimerValue: UILabel!
    var timerCount = 0
    var timer : Timer?
    var tracker: Tracker?
    weak var delegate: TrackerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblTopic.text = tracker?.topicName
        lblTimer.text = tracker?.timerDisplayValue
    }
    
    @IBAction func startTimer(_ sender: UIButton) {
        timerCount = tracker?.timeInterval as! Int
        let min = (timerCount/60) - 1 // 5
        let seconds = 59
        scheduleNotification()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimerValue), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimerValue() {
        if timerCount > 0 {
            lblTimerValue.text = String(timerCount) + " seconds"
            timerCount -= 1
        } else {
            // timer is over
            cancelTimerAndNotification()
        }
    }
    
    func cancelTimerAndNotification() {
        guard let identifier = tracker?.topicName else { return}
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
        timerCount = 0
        timer?.invalidate()
        
        guard let tracker = tracker else {
            return
        }
        delegate?.removeTrackerfromList(tracker: tracker)
        showCancelAlert()
    }
    
    @IBAction func cancelTimer(_ sender: UIButton) {
        // cancel is pressed
        cancelTimerAndNotification()
    }
    
    
    
}

extension TrackerVC: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // notification arrived
        showAlert()
        print("will present notification")
        completionHandler(UNNotificationPresentationOptions.sound)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        // notification clicked or opened
        print("did receive notification")
    }
    
    func scheduleNotification() {
        // Schedule the request.
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        guard let tracker = tracker else { return }
        let request = NotificationManager.getNotificationRequest(tracker: tracker)
        center.add(request) { (error : Error?) in
            if let theError = error {
                print(theError.localizedDescription)
            } else {
                print("local notification scheduled successfully")
            }
        }
    }
    
    func removeNotification( identifier: String) {
    }
    
    func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func showCancelAlert() {
        let alertVC = UIAlertController.init(title: "Notification cancelled", message: "Your Notification has been cancelled successfully", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showAlert() {
        let alertVC = UIAlertController.init(title: tracker?.topicName, message: "You have studied for \(String(describing: tracker?.timerDisplayValue)). Take a break", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
