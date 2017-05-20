Models:
- User
- Calendar
- Tasks
end

Users:
- Has one calendar
- Has many tasks 
- Can only see there own calendar.
- Can perform crud only on their own tasks
end

Calendars:
- Belongs to a user
- Has many tasks 
end

MyTasks:
- Join table between tasks and user
end

Tasks:
- Belongs to user
- Belongs to day
- Has location :optional
- Datetime
end 