---
description: >-
  Key Digital Functionalities describe the core (required) functions that this
  Building Block must be able to perform.
---

# 4 Key Digital Functionalities

## 4.1 **Current scope:**

The functional requirements to cover the services required from the Scheduler Building Block currently have considered specific use cases of Post-Partum Child Care program and Unconditional Social Cash Transfer program. However, the considerations can be generalized for different types of events involving one or more participants.&#x20;

Currently the following actors have been identified as "users" of the scheduler building block:

* "Building Block Admin"  who manages the building block's implementation settings. A building block admin is also responsible to enrolment of entitles and Organizers of those entities that use the scheduler building block.&#x20;
* "Resources" who participate in events to perform various services. Resources MUST be registered in the Scheduler before they can be enrolled in events. Resources MAY provide services in multiple entities in time-shared mode (e.g. specialist doctors provide services in multiple hospitals). Hence a registered resource MUST also be affiliated in specific work days and hours to a Host entity, before participation in the events of that entity.
* "Organizer" are resources who manage event schedules using the Scheduler. An Organizer must be a registered and affiliated to a Host entity to manage the events of that entity.
* "Subscribers" who participate in events to consume various activities. Subscribers must be registered in the Scheduler before they can be enrolled in events. Subscribers MAY be enrolled in multiple events.&#x20;

The Scheduler MUST have several key digital functionalities to enable these actors perform their roles in events. A scheduled event by definition should have pre-determined start and ending date time, venue, participant resources (which carry out some activity when alerted) and subscribers which consume activities of the resource in an event. For example  a doctor( resource) may provide consultation (event) to a patient(subscriber) at a specific hospital (host-entity) on appointment (schedule). Similarly, the scheduler may alert a payroll application (Resource) to calculate salary payments (event) on last day of the month (schedule). The scheduler may also alert a payment building block (Resource) to transfer  as per statements the salaries to health workers in Post-Partum Care program or subsidies to beneficiaries in USCT program on first day of month (schedule).&#x20;

**The Scheduler MUST enable Building Block Admins to**

* register without duplication an entity, into its Entity List with details (e.g. name, phone, email, website, etc.) The entities host various "events" involving their affiliated resources.
* categorize entities for easy searching and sorting. In current scope, "Hospital",  "Health ministry", "Social welfare ministry" may be example entities.&#x20;
* register resources and affiliate them as "Organizer" in specific entity for management of events hosted by that entity.&#x20;
* configure rules for performance, security and communication management between the scheduler and other building blocks, applications and event participants. The exact parameters may be decided at implementation time&#x20;
* extract log reports from the system as needed for monitoring and administering the building block operations.

**The scheduler MUST enable Organizers to**

* register resources (persons, facilities, equipment, s/w building blocks/apps, vehicles, etc.) without duplication into Scheduler's resource list with contact details (phone/mail/URL/),  as needed for communication and reuse for enrolment to multiple events.&#x20;
* categorize resources for easy searching and sorting. In current scope, "doctor",  'payroll app" and "Payments app" are example resource categories.&#x20;
* affiliate a registered resource into one or more entities with non-overlapping weekdays and working hours. (e.g. a doctor could provide consultation during mornings at a specific hospital, and teaching at another entity in afternoon on specific weekdays).&#x20;
* register subscribers (persons, equipment, s/w building blocks/apps, etc.) without duplication into Scheduler's Subscriber list with contact details (phone/mail/URL/) as needed for communication, and reuse for enrolment to multiple events.&#x20;
* categorize Subscribers for easy searching and sorting. In current scope, "patient", "beneficiary", "student"  are example resource categories.
* register events with a defined starting and ending time and  an optional deadline for participants to log in their attendance in the event, if needed.
* to restricted number of Subscribers to an event.&#x20;
* to categorize events for easy searching and sorting. In current scope, "doctor consultation", 'payroll" and "Payments" are example event categories.&#x20;
* brand an event by name and description. An organizer must be able to define a name and description for an event as needed.
* search for resources of a specific category in a specific registered entity
* search for free (unallocated) time slots of specific resources in a chosen date-time range&#x20;
* enroll a registered resource of the Host entity into a predefined event to provide respective services (before/during/after the event). The same resource may be enrolled  into multiple non-overlapping events within the affiliated work days and hours of that resource in the Host entity&#x20;
* search and list details of events with a chosen category, host entity and resource which are open for subscription in a given date time range
* enroll a registered subscriber into a predefined event to participate as a beneficiary of  the event. The same subscriber may be enrolled to multiple events, but each enrollment will generate a unique appointment id
* define and maintain a library of predefined stack of messages for specific Host entity so that it can be reused in multiple events conducted by the specific host entity.&#x20;
* define alert schedules for sending specific Alert messages associated with specific event at specific date-time to associated subscribers or resources or both.&#x20;
* define multiple alert schedules (before, during, after) for the same event&#x20;
* to extract logs related to events that help in continuous improvement in event management
* search and extract details of one or more events, resources, subscribers, alert messages templates and logs associated with entities where the Organizer is also affiliated with.

**The scheduler MUST enable Resources to**

* search and extract their own registration details in the scheduler
* search and extract their own affiliation details across associated entities
* search and extract details of appointments and events they are enrolled into
* search and extract details of subscribers of events they are enrolled into
* receive scheduled alert messages from events they are enrolled into
* search and list details of events of chosen category, host entity in a specified date-time range
* log status/attendance updates related to events they are enrolled into

**The scheduler MUST enable Resources to**

* search and extract their own registration details in the scheduler
* search and list details of events with a chosen category, host entity and resource which are open for subscription in a specified date-time range
* enroll themselves into a predefined event to participate as a beneficiary of  the event and obtain corresponding unique appointment id
* search and extract details of appointments and events they are enrolled into
* receive scheduled alert messages from events they are enrolled into
* log status/attendance updates related to events they are enrolled into

#### The Scheduler must automated internal functionality to

* track all alert schedules and send corresponding alert messages with unique tokens to relevant participants at appropriate times
* Log each alert sent with date-time stamp and a unique token in Scheduler's log that can be used later to relate responses from recipients of the alerts.&#x20;
* receive and log acknowledgement/status/attendance updates from event participants date time stamp, optional location stamp and sender information.
* update event status(started/ended/open/closed) depending on date-time and subscriber limit
* poll participants for status updates, by giving the unique token of a specific alert it sent.
* log transactions done by all actors along with actor type and id and date time stamp. Associated implementation specific details that are not specified here.
* monitor and log internal metrics (e.g. latency/capacity utilization/communication failures/etc.) to help in maintenance and capacity management depending on needs of implementation.  Associated implementation specific details that are not specified here.
* detect communication failure with other building blocks and applications and perform retries according to configured rules before logging a communication failure. Associated implementation specific details that are not specified here.&#x20;
* monitor the logs and mark the participant as absent an attendance log did not arrive within a specified deadline. Associated implementation specific details that are not specified here.

## **4.2 Out of scope** <a href="#_heading-h.qsh70q" id="_heading-h.qsh70q"></a>

The Scheduler Building Block will provide the following key digital functionalities to support the automation of event management in different phases:

* The Scheduler can be used to trigger activities based on time only. Evaluation of any criteria other than time-based evaluations for the generation of a trigger is out of scope.&#x20;
* Alerts based purely on human decision are out of scope.
* Any logical evaluations prior to the onset of alerting applications or building blocks are out of scope.&#x20;
* An event participant MUST implement own logic to evaluate other conditions as needed before taking action based on an alert. (e.g., an accounts application alerted to initiate salary payments may check if a payroll has been approved before initiating payments).&#x20;
