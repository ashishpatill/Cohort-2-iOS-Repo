#  Project structure

## UI
- TrackerListVC.swift
    - TableView - did select to navigate to Tracker screen
- TrackerVC.swift
    - Topic name
    - Timer
    - Start and stop button
- Add Tracker VC
    - Picker
    - Text field for topic name
    - Save button

## DATA
- Tracker Object (Struct)
    - Topic name
    - Date (day and time)
    - status (if task is completed) - Optional
    - time spent on the topic - Optional
    
- Update tracker timer logic
    - NSTimer to update time label
    - if timer is completed 
        - delete the tracker object from list
        - remove the local notification
        
- Local notification
    - schedule a notification for target date
    - will fire when tracker is completed 
    - will be deleted if tracker is cancelled


- 5 min - (currentDate + 5 min) * 60
- 15 min
- 30 min
- 1 hour
- 2 hour
- 5 hour
