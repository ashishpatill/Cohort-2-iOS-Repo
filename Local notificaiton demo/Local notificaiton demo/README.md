#  Local notification 

## Setup

1. Take user Permission in AppDelegate's didFinishLaunching function
2. Create content for Local notification

        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!", arguments: nil)
        content.sound = UNNotificationSound.default
        
3. Schedule the local notification
   a. Create a date component for date and time when you want to show the notification
   b. Create a trigger with date component
   c. Create a request with trigger 
   d. Assign a delegate to center. This will execute two functions  
   e. Executing the request with center.add       

4. Handle delegates
   a. handle will present
   b. handle didReceive
