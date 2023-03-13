# 4 Key Digital Functionalities

## **Current scope of functionalities considered of this BB**

* The functional requirements to cover the services required from the Scheduler BB currently have considered specific use cases of consultation appointment booking, periodic payment calculation and payment processing triggering in Post-Partum and Child Care program. The considerations can be generalized for different types of appointments involving two or more participants.
* This BB abstracts away the complexity of scheduling process which otherwise has to be implemented in each application that needs to coordinate multiple scheduled events, each with its own episodes, sessions and associated notifications to multiple subscribers through heterogeneous channels. The scheduler considers requirements in terms of sessions, episodes and Events where session is the smallest schedulable slot of time, an “episode” is a pack of consecutive sessions on a specific date, and an “Event” may host multiple episodes over a period (date range).  In its simplest case, an event has a single episode, single session, single resource and single target to be notified.  A complex event (e.g. medical camp) may span several days with multiple episodes(e.g. consultation, screening, etc.), involving multiple resource persons, facilities and consumers. The same analogy applies to automated systems as well, where devices are “notified” to run specific job sessions, and groups of such sessions (episodes) repeat on different days over a date range (Event).
* A single session may involve multiple notifications to multiple targets (e.g alerts to patient/doctor/health worker associated with a consultation session, triggering systems for transfer of salaries, etc.).
* This building block may also receive status updates from other GovStack BBs in response to triggered events in three possible ways- through call-back endpoints published to triggered systems, through IM-pub-sub modules of triggered BBs or by polling a triggered system for a status update.
* The scheduling building block may also be used as an embedded block of other building blocks using the same REST APIs as an embedded service interface.
* Specific messages must be defined while configuring an event schedule, as needed for different episodes and sessions therein to automatically notify target recipients.
* An event schedule may be set up in advance with placeholders for different episodes and session slots, and later specific resources and consumers may be added to specific sessions as and when needed. Details already known can also be fed in upfront during the setting up of the event schedule.

## Functionalities:

The scheduler BB will provide the following key digital functionalities to support the automation of event management in different phases:

* Event Scheduling: Create/update/cancel sessions for different activities, which may repeat as several episodes during an Event.
* Alert Management: Create/update/remove/send alerts to relevant subscribers/resources in various sessions as per schedule.
* Resource management: Add/Remove resources (personnel/facility/etc.) in specific session(s) of an event to carry out specific activities.
* Appointment management:  Add/remove/configure subscribers(patients/other BBs/machines/etc.) in specific session(s) in the worklist.
* Schedule Tracking:  Monitor schedules and send alert messages of all sessions as per respective alert configuration.
* Status Reporting: Maintain log of status updates from subscribers (sent proactively or by polling) and generate reports when requested.
