---
description: This section provides context for this Building Block.
---

# 2 Description

Digital governance may employ common software components (Building Blocks) to automate heterogeneous software applications. Different activities of such components may be triggered based on a specific epoch (date-time) in order to orchestrate a sequence of steps within an automated workflow. Instead of replicating the logic needed by each component to schedule, track, trigger and coordinate its activities with other building blocks and applications the "Scheduler" Building Block enables aggregated coordination of time-driven activities within and across Building Blocks by sending appropriate "alert" messages to appropriate Building Blocks according to a predefined schedule.

Each event is identified by an ID field and has a specific name, date, time, and duration. An event may empanel multiple resources (personnel, facilities, equipment, etc.) from different entities to perform various activities. An event may also enrol subscribers to benefit from activities of the event. The Scheduler may have to alert (trigger) specific resources and subscribers at specific times before, during, and after the event. With specific messages in order to carry out respective activities. The Scheduler Building Block contains various functionalities necessary to enable planning, booking, tracking, triggering, notifying, and status reporting needs of multiple events. It hosts several micro-services that orchestrate these functionalities, exposed through RESTful APIs. This Building Block can be used for scheduling events in a wide variety of applications and use cases such as:

**Health sector**

• Booking appointments with service providers for consultation, therapy, tests, etc.

• Planning and tracking prescribed activities for medication, diet, or exercises.

• Acquiring periodic reports from medical monitoring devices.

**eCommerce Sector**

• Shipment planning and tracking in supply chain management.

• Announcements for public awareness and programs.

• Maintenance checks for equipment.

**Agriculture sector**

• Custom planning for agricultural activity such as seeding, harvesting, etc., involving agro-machinery and skilled labor force.

• Planning and booking of third-party services such as machinery maintenance, transportation, etc.

**Education sector**

• Scheduling classes, exams, official meetings, seminars, etc.

• Scheduled events as deadline-based submission of assignments, reports, etc.

## 2.1 **Current scope**

The functional requirements to cover the services required from the Scheduler Building Block currently have considered specific use cases of&#x20;

* Post-Partum Child Care program ([https://app.gitbook.com/o/pxmRWOPoaU8fUAbbcrus/s/YLLEfCKTnmzAMDSDzJJH/product-use-case/hltc-1-postpartum-and-infant-care](https://app.gitbook.com/s/YLLEfCKTnmzAMDSDzJJH/use-cases/hltc-1-postpartum-and-infant-care)).
* Unconditional Social Cash Transfer program. [https://app.gitbook.com/o/pxmRWOPoaU8fUAbbcrus/s/YLLEfCKTnmzAMDSDzJJH/product-use-case/inst-1-unconditional-social-cash-transfer](https://app.gitbook.com/s/YLLEfCKTnmzAMDSDzJJH/use-cases/inst-1-unconditional-social-cash-transfer).&#x20;

These use cases bring forth the need for example implementations of events such as scheduling doctor appointment for patients, scheduling payroll computation for health workers, and disbursement of salaries and incentives for health workers and beneficiaries of the programs. However, the considerations can be generalized for different types of events involving one or more participants.&#x20;

Currently the following actors have been identified as "users" of the scheduler building block:

* "Building Block Admin"  who manages the building block's implementation settings. A building block admin is also responsible to enrolment of entitles and Organizers of those entities that use the scheduler building block.&#x20;
* "Resources" who participate in events to perform various services. Resources MUST be registered in the Scheduler before they can be enrolled in events. Resources MAY provide services in multiple entities in time-shared mode (e.g. specialist doctors provide services in multiple hospitals). Hence a registered resource MUST also be affiliated in specific work days and hours to a Host entity, before participation in the events of that entity.
* "Organizer" are resources who manage event schedules using the Scheduler. An Organizer must be a registered and affiliated to a Host entity to manage the events of that entity.
* "Subscribers" who participate in events to consume various activities. Subscribers must be registered in the Scheduler before they can be enrolled in events. Subscribers MAY be enrolled in multiple events.&#x20;

The Scheduler MUST be able to enable enable these actors to perform in their roles associated with one or more events.  More specifically, the scheduler should facilitate following activities of the actors:

**2.1.1. The Scheduler MUST enable Building Block Admins to**

* register without duplication an entity, into its Entity List with details (e.g. name, phone, email, website, etc.) The entities host various "events" involving their affiliated resources.
* categorize entities for easy searching and sorting. In current scope, "Hospital",  "Health ministry", "Social welfare ministry" may be example entities.&#x20;
* register resources and affiliate them as "Organizer" in specific entity for management of events hosted by that entity.&#x20;
* configure rules for performance, security and communication management between the scheduler and other building blocks, applications and event participants. The exact parameters may be decided at implementation time&#x20;
* extract log reports from the system as needed for monitoring and administering the building block operations.

**2.1.2  The scheduler MUST enable Organizers to**

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

**2.1.3  The scheduler MUST enable Resources to**

* search and extract their own registration details in the scheduler
* search and extract their own affiliation details across associated entities
* search and extract details of appointments and events they are enrolled into
* search and extract details of subscribers of events they are enrolled into
* receive scheduled alert messages from events they are enrolled into
* search and list details of events of chosen category, host entity in a specified date-time range
* log status/attendance updates related to events they are enrolled into

**2.1.4  The scheduler MUST enable Subscribers to**

* search and extract their own registration details in the scheduler
* search and list details of events with a chosen category, host entity and resource which are open for subscription in a specified date-time range
* enroll themselves into a predefined event to participate as a beneficiary of  the event and obtain corresponding unique appointment id
* search and extract details of appointments and events they are enrolled into
* receive scheduled alert messages from events they are enrolled into
* log status/attendance updates related to events they are enrolled into

#### 2.1.5  The Scheduler must automated internal functionality to

* track all alert schedules and send corresponding alert messages with unique tokens to relevant participants at appropriate times
* Log each alert sent with date-time stamp and a unique token in Scheduler's log that can be used later to relate responses from recipients of the alerts.&#x20;
* receive and log acknowledgement/status/attendance updates from event participants date time stamp, optional location stamp and sender information.
* update event status(started/ended/open/closed) depending on date-time and subscriber limit
* poll participants for status updates, by giving the unique token of a specific alert it sent.
* log transactions done by all actors along with actor type and id and date time stamp. Associated implementation specific details that are not specified here.
* monitor and log internal metrics (e.g. latency/capacity utilization/communication failures/etc.) to help in maintenance and capacity management depending on needs of implementation.  Associated implementation specific details that are not specified here.
* detect communication failure with other building blocks and applications and perform retries according to configured rules before logging a communication failure. Associated implementation specific details that are not specified here.&#x20;
* monitor the logs and mark the participant as absent an attendance log did not arrive within a specified deadline. Associated implementation specific details that are not specified here.

## 2.2 Out of Scope

The following aspects are out of scope of the current version of the scheduler building block specifications considered in this document:

* Evaluation of any criteria other than time-based evaluations for the generation of a trigger is out of scope. The Scheduler can be used to trigger activities based on time only.
* Alerts based on human decision are out of scope. This Scheduler specification is intended for automation of time-based alerting process only.
* Any logical evaluations prior to the onset of alerting applications or building blocks are out of scope. (e.g. repeating an alert if acknowledgement is not received for previous alert)
* An event participant MUST implement own logic to evaluate other conditions as needed before taking action based on an alert. (e.g. if an accounts application is alerted to initiate salary payments but it must check if a payroll has been approved before initiating payments).
* The Scheduler can be used to trigger activities based on time only. Evaluation of any criteria other than time-based evaluations for the generation of a trigger is out of scope.
* Alerts based purely on human decision are out of scope.
