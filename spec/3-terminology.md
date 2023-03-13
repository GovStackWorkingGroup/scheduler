# 3 Terminology

**1.     Sessions, Episodes and Events:** Event, episode, session convey pre-scheduled date-time slots allocated for specific service activities such as consultation, maintenance, monitoring, etc. The scheduler considers a session as the smallest schedulable slot of time, an “episode” is a pack of consecutive sessions on a specific date, and an “Event” may host multiple episodes over a period (date range). Episodes are collections of sessions of the same type over a continuous time span within a day. An event is a collection of one or more episodes that may repeat with specific intervals over a period of time (e.g. monthly salary payments, weekly meetings, therapy sittings, etc.).

**2.     Appointment:** This is the booking of specific subscribers (persons/systems) for a specific session, episode or event. The scheduler can create, maintain and track multiple appointments of multiple subscribers in the form of a worklist and generates alerts to specific subscribers at appropriate times as needed before/during/after the appointed slot.

**3.     Session Slot:** A slot is the time period of a session defined by its Starting and ending date-time specification to carry the specific activity.

**4.     Session Status:** current state of a session (proposed/published/booked/started/completed/no\_show/failed/cancelled).

**5.     Activity**: What is to be done during a specific session (e.g. diagnostics, consultation, vaccination, interview, therapy, teaching, meeting).

**6.     Host entity:** Identity of an Entity that owns the responsibility for the event (Identify a hospital, school, company, hotel, etc.).

**7.     Organizer:** A user authorized by Host to manage event schedules using this building block.

**8.     Subscriber:** A person or an application that is the target audience for specific sessions (students, patients, software apps, devices, etc.).

**9.     Session Locations:** Address of physical location of facilities where the event is hosted. If the event is purely online, the location will be “Virtual”

**10.  Period:** A range of consecutive days defined by start and end dates

**11.  Alert Policy:** Rule for sending notification to specified users and applications for a specific session (reminders/triggers/etc.)

**12.  Alert Message:** Specific info to be sent for alerting subscribers and resources (e.g. reminders, triggers (start/end of workflows in BBs), etc.)

**13.  Alert Targets:** Resource and Subscribers to send trigger message

**14.  Alert Mode:** Messaging method to be used for each specified target (SMS/email/URI)

**15.  Alert schedule:** date/times at which specific alerts must be sent

**16.  Alert Status:** A text that indicates the state of a specific Alert (undefined, armed, qualified, sent, acknowledged, failed)

**17.  Episode Status:** Indicates if a particular episode name within an event is (pending/started/ended/no-show/cancelled)

**18.  Event Status:** Indicates if a particular event name is (pending/started/ended/no-show/cancelled)

**19.  Resource Category:** (doctor, nurse, equipment, ambulance, etc.) needed to conduct a given session

**20.  Resource ID:** Identity of a specific person/facility/equipment that is used to provide services in an Event

**21.  Resource Name:** Individual name (a person’s name, a doctor, speaker, teacher, ambulance, conference room, maintenance toolkit, etc.)

**22.  Affiliation:** The organization (legally registered entity) that a subscriber or resource represents in an Event

**23.  Log report:** Information from a log of proceedings of a specified event (e.g. who attended and when, no-shows, resource utilized, etc.)
