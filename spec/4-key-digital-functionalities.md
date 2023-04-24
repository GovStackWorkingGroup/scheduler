---
description: >-
  Key Digital Functionalities describe the core (required) functions that this
  Building Block must be able to perform.
---

# 4 Key Digital Functionalities

The functional requirements to cover the services required from the Scheduler Building Block currently have considered specific use cases of

* [Post-Partum Child Care program](https://govstack.gitbook.io/product-use-cases/v/product-use-cases-1.0/readme/hltc-1-postpartum-and-infant-care).
* [Unconditional Social Cash Transfer program](https://govstack.gitbook.io/product-use-cases/v/product-use-cases-1.0/readme/inst-1-unconditional-social-cash-transfer).

These use cases bring forth the need for an example implementation of events such as scheduling a doctor appointment for patients, scheduling payroll computation for health workers, and disbursement of salaries and incentives for health workers and beneficiaries of the programs. However, the considerations can be generalized for different types of events involving one or more participants.

## **4.1 Event Management**

Authorized organizers of a host entity (such as health workers/admins/etc.)must be able to create and manage schedules of events involving several resources, subscribers, and activities that have to be reminded/triggered/informed through alerts at appropriate times before/during/after the event. Each event schedule will contain under a unique EventId, details such as a description of the event, which entity is hosting the event, when is the event starting and ending, how many subscribers are allowed, terms of subscription, the current status of the event, deadlines for getting attendance from participants, etc. Schedules of multiple events can be configured, tracked, and managed, avoiding any duplication.

## **4.2 Entity Management**

The Scheduler must enable the administrator of the Building Block to register multiple entities that will use the Scheduler. Each entity will have at least one person registered under "resources" as an Organizer of various events hosted by that entity. An entity may have multiple affiliated resources that can be allocated to different events hosted by the entity. The Scheduler must enable the registration of details about registered entities with duplication avoidance.

## **4.3 Alert Schedule Management**

Authorized organizers of a host entity may schedule one or more alert messages to be sent to specific resources/subscribers of an event before, during, or after an event. It also provides for the mechanism to send alert messages according to the preferred Alerting mode (through Information Mediator to a target Building Block/application URL endpoint, or publish it in its local Information Mediator + Pub/Sub module or through Messaging Building Block. Every alert sent is tagged for tracking status updates from alerted parties (for example an event started/ended/no show/etc.). Each alert sent is tagged with a unique token from Scheduler that can be used to relate responses from recipients of the alerts. The alerted Building Block/app can take appropriate actions based on the alert message and may send attendance/status to an endpoint on the scheduler along with the token. The Scheduler can also poll for status updates, by giving the unique token of a specific alert it sent.

## **4.4 Alert Message Management**&#x20;

It must be possible for an entity to have its own stack of ready-made message templates that be reused in one or more notifications in multiple events hosted by that entity. Typically organizers of the event maintain this stack of alert templates (reminders/updates/etc.) under specific categories aligned to their business needs. The alerts may further be tagged with a category (appointment reminders/ activity triggers/ etc.) for easy search and identification purposes.

## **4.5 Resource Management**

Authorized organizers of a host entity may enrol different resources resource (persons, facilities, equipment, vehicle, etc.) into respective entities. This scheduler retains the Resource details such as its name, category (doctor/nurse/teacher/health worker/admin/etc.), contact details (phone/mail/URL), etc., as needed for communication, against a unique event id for each Resource. Organizers may search for resources that are free (unallocated) together in a chosen date-time range, or look for time zones when chosen resources are free together. The Scheduler allows multiple entities to register the same resource supported by a de-duplication filter from the Scheduler to avoid replicas in storage.

## **4.6 Subscriber Management**&#x20;

The subscriber is details of a person/equipment/facility identified by a name and contact details. The Scheduler enables registration of new subscribers by storing their profile and contact information against a unique Id in such a way the same subscriber details can be reused for subscription to several events. Subscribers may also be tagged to a category such as a student/ patient /beneficiary/etc.

## **4.7 Affiliation Management**&#x20;

The Scheduler must enable the same resource to be affiliated with multiple entities with non-overlapping weekdays and working hours. (e.g. a doctor may work at different hospitals on specific days and time spans). The organizer may allocate resources of their entity into multiple non-overlapping events within the affiliated time zone of their entity for that resource. (e.g. a doctor could provide consultation to a series of patients during their work hours at a specific hospital).

## **4.8 Appointment Management**&#x20;

This key digital functionality enables the enrollment of registered subscribers into a specific event. The same subscriber may be enrolled with different token ids into different events. In case a subscriber is a person, the person can subscribe to a chosen event or take assistance from an authorized third party (e.g. health worker or a call-center admin) to subscribe him/her self or their application/device that represents them as a participant subscriber into a chosen event.

## **4.9 Status Logging and Reporting**&#x20;

This key digital functionality maintains logs of user-driven transactions, activities originating from this Building Block as well as status updates coming from external sources. All logs contain a date time stamp, an optional location stamp, details of the information source, and the status of the transaction. For example, the Scheduler can log all alerts it generates and all events that are created/updated/cancelled. It can also log status updates from external Building Blocks or applications (e.g. completion of an event) coming through Information Mediator, Pub/Sub, or Messaging Building Block interfaces. The Scheduler must enable an authorized administrator to get a report of logged information in a chosen category and date range and category across events. The Scheduler does not retain any reports. The Scheduler may also monitor and log internal metrics (e.g. latency/capacity utilization/communication failures/etc.) to help in maintenance and capacity management depending on the needs of implementation. For example, if an alert recipient does not acknowledge within a fixed duration the Scheduler may be designed to resend the trigger/notification for a given number of retries before logging a communication success or failure. In another implementation, the Scheduler may be designed to monitor the logs and mark the participant as absent if an attendance log did not arrive within a certain duration after the alert was sent. These are implementation-specific details that are not specified here.

## **4.10 Information Mediator Interface**&#x20;

This interface handles protocols to interact with the Information Mediator Building Block in order to securely expose Scheduler services to other Building Blocks and also enables scheduler access services of other Building Blocks and applications through the Information Mediator Building Block.

## **4.11 Messaging interface**&#x20;

The interface handles protocols to interact with the messaging Building Block for sending alerts to event participants and receiving incoming messages through the Messaging Building Block. This maintains an internal queue of messages until they are passed on to the Messaging Building Block.

## **4.12 PubSub Interface**&#x20;

The interface handles protocols to interact with Pub/Sub messaging rooms assigned to publish asynchronous messages to event participants and receive incoming messages published by participants in the Pub/Sub rooms of the host application.

## **4.13 Building block administration**&#x20;

This key digital functionality enables the setting up of internal configuration requirements that define the technical behaviour of the Building Block. It also provides for a Building Block administrator to monitor and take actions that regulate the usage and performance of the Building Block. This also provides functionalities for the registration of new entities and Event Organizers within those entities.

Currently, the following actors have been identified as "users" of the Scheduler Building Block:

* "Building Block Admin" manages the building block's implementation settings. A Building Block admin is also responsible for the enrollment of entitles and Organizers of those entities that use the Scheduler Building Block.
* "Resources" who participate in events to perform various services. Resources MUST be registered in the Scheduler before they can be enrolled in events. Resources MAY provide services in multiple entities in time-shared mode (e.g. specialist doctors provide services in multiple hospitals). Hence a registered resource MUST also be affiliated in specific work days and hours to a Host entity, before participation in the events of that entity.
* "Organizers" are resources who manage event schedules using the Scheduler. An Organizer must be registered and affiliated with a Host entity to manage the events of that entity.
* "Subscribers" who participate in events to consume various activities. Subscribers must be registered in the Scheduler before they can be enrolled in events. Subscribers MAY be enrolled in multiple events.

The Scheduler MUST have several key digital functionalities to enable these actors to perform their roles in events. A scheduled event by definition should have a pre-determined start and ending date time, venue, participant resources (which carry out some activity when alerted) and subscribers which consume activities of the resource in an event. For example, a doctor( resource) may provide consultation (event) to a patient(subscriber) at a specific hospital (host-entity) on an appointment (schedule). Similarly, the Scheduler may alert a payroll application (Resource) to calculate salary payments (event) on the last day of the month (schedule). The Scheduler may also alert a Payment Building Block (Resource) to transfer as per statements the salaries to health workers in the PostPartum Care program or subsidies to beneficiaries in the USCT program on the first day of the month (schedule).

**The Scheduler MUST enable Building Block Admins to**

* register without duplication an entity, into its Entity List with details (e.g. name, phone, email, website, etc.). The entities host various "events" involving their affiliated resources.
* categorize entities for easy searching and sorting. In the current scope, "Hospital", "Health ministry", and "Social welfare ministry" may be examples of entities.
* register resources and affiliate them as "Organizers" in a specific entity for the management of events hosted by that entity.
* configure rules for performance, security and communication management between the scheduler and other Building Blocks, applications and event participants. The exact parameters may be decided at implementation time
* extract log reports from the system as needed for monitoring and administering the Building Block operations.

**The scheduler MUST enable Organizers to**

* register resources (persons, facilities, equipment, s/w building blocks/apps, vehicles, etc.) without duplication into Scheduler's resource list with contact details (phone/mail/URL/), as needed for communication and reuse for enrolment to multiple events.
* categorize resources for easy searching and sorting. In the current scope, "doctor", 'payroll app" and "Payments app" are example resource categories.
* affiliate a registered resource into one or more entities with non-overlapping weekdays and working hours. (e.g. a doctor could provide consultation during mornings at a specific hospital, and teach at another entity in the afternoon on specific weekdays).
* register subscribers (persons, equipment, s/w building blocks/apps, etc.) without duplication into Scheduler's Subscriber list with contact details (phone/mail/URL/) as needed for communication, and reuse for enrolment to multiple events.
* categorize Subscribers for easy searching and sorting. In the current scope, "patient", "beneficiary", and "student" are example resource categories.
* register events with a defined starting and ending time and an optional deadline for participants to log in their attendance in the event if needed.
* to restrict the number of Subscribers to an event.
* to categorize events for easy searching and sorting. In the current scope, "doctor consultation", "payroll" and "Payments" are example event categories.
* brand an event by name and description. An organizer must be able to define a name and description for an event as needed.
* search for resources of a specific category in a specific registered entity.
* search for free (unallocated) time slots of specific resources in a chosen date-time range.
* enrol a registered resource of the Host entity into a predefined event to provide respective services (before/during/after the event). The same resource may be enrolled into multiple non-overlapping events within the affiliated work days and hours of that resource in the Host entity.
* search and list details of events with a chosen category, host entity and resource which are open for subscription in a given date-time range.
* enrol a registered subscriber into a predefined event to participate as a beneficiary of the event. The same subscriber may be enrolled on multiple events, but each enrollment will generate a unique appointment id.
* define and maintain a library of a predefined stack of messages for a specific Host entity so that it can be reused in multiple events conducted by the specific host entity.
* define alert schedules for sending specific Alert messages associated with a specific event at a specific date-time to associated subscribers or resources or both.
* define multiple alert schedules (before, during, after) for the same event.
* to extract logs related to events that help in continuous improvement in event management.
* search and extract details of one or more events, resources, subscribers, alert messages templates and logs associated with entities which the Organizer is also affiliated with.

**The scheduler MUST enable Resources to**

* search and extract their own registration details in the Scheduler.
* search and extract their own affiliation details across associated entities.
* search and extract details of appointments and events they are enrolled into.
* search and extract details of subscribers of events they are enrolled into.
* receive scheduled alert messages from events they are enrolled into.
* search and list details of events of the chosen category, host entity in a specified date-time range.
* log status/attendance updates related to events they are enrolled into.

**The scheduler MUST enable Subscribers to**

* search and extract their own registration details in the Scheduler.
* search and list details of events with a chosen category, host entity and resource which are open for subscription in a specified date-time range.
* enrol themselves into a predefined event to participate as a beneficiary of the event and obtain a corresponding unique appointment ID.
* search and extract details of appointments and events they are enrolled into.
* receive scheduled alert messages from events they are enrolled into.
* log status/attendance updates related to events they are enrolled into.

#### The Scheduler must automate internal functionality to

* track all alert schedules and send corresponding alert messages with unique tokens to relevant participants at appropriate times.
* Log each alert sent with a date-time stamp and a unique token in the Scheduler's log that can be used later to relate responses from recipients of the alerts.
* receive and log acknowledgement/status/attendance updates from event participants date time stamp, optional location stamp and sender information.
* update event status (started/ended/open/closed) depending on date-time and subscriber limit.
* poll participants for status updates, by giving the unique token of a specific alert it sent.
* log transactions done by all actors along with actor type and id and date time stamp. Associated implementation-specific details that are not specified here.
* monitor and log internal metrics (e.g. latency/capacity utilization/communication failures/etc.) to help in maintenance and capacity management depending on the needs of implementation. Associated implementation-specific details that are not specified here.
* detect communication failure with other Building Blocks and applications and perform retries according to configured rules before logging a communication failure. Associated implementation-specific details that are not specified here.
* monitor the logs and mark the participant as absent if an attendance log did not arrive within a specified deadline. Associated implementation-specific details that are not specified here.

## 4.3 Out-of-Scope Assumptions

The Scheduler Building Block will provide the following key digital functionalities to support the automation of event management in different phases:

* The Scheduler can be used to trigger activities based on time only. Evaluation of any criteria other than time-based evaluations for the generation of a trigger is out of scope.
* Alerts based purely on human decision are out of scope.
* Any logical evaluations prior to the onset of alerting applications or Building Blocks are out of scope.
* An event participant MUST implement their own logic to evaluate other conditions as needed before taking action based on an alert. (e.g. an accounts application alerted to initiate salary payments may check if a payroll has been approved before initiating payments).
* The Scheduler can be used to trigger activities based on time only. Evaluation of any criteria other than time-based evaluations for the generation of a trigger is out of scope.
* Alerts based purely on human decision are out of scope.
* Any logical evaluations prior to the onset of alerting applications or Building Blocks are out of scope. The application/Building Block MUST implement its own logic to evaluate other conditions before taking action based on an alert. (e.g. the accounts application may check whether a payroll has been approved before initiating payments when alerted by the Scheduler to initiate salary payments).
