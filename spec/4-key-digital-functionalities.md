---
description: >-
  Key Digital Functionalities describe the core (required) functions that this
  Building Block must be able to perform.
---

# 4 Key Digital Functionalities

## 4.1 **Current scope:**

The functional requirements to cover the services required from the Scheduler Building Block currently have considered specific use cases of consultation appointment booking, periodic payment calculation and payment processing triggering in the Post-Partum and Child Care program. The considerations can be generalized for different types of events involving one or more participants.&#x20;

The scheduler Building Block MUST provide scheduling-related services for coordinating time-based activities among other Building Blocks/applications/devices/people by sending appropriate alert notifications to them at appropriate times. These services MUST be exposed through RESTful API interfaces as defined by OpenAPI v3+ standards.

The Scheduler MUST have any response data payload it returns through its API only in the form of JSON formatted datasets. It is left to the application consuming the response to present it appropriately (e.g. as an Event list or calendar) and provision for associated user interface interactions.

The Scheduler Building Block allows the configuration of a single event at a time. Even if the same event is to repeat on different date-times, the location, resources, and subscribers need to not be the same. Hence the application MUST schedule each instance of the event separately.

The Scheduler must allow administrators to access information (events, resources, subscribers, alerts, etc.) related to their entity only.

The Scheduler Building Block MUST enable usage from the following actors:

* "BB\_Admin" who manages this Building Block to run efficiently in a hosted environment;
* "Organizer" who manages event schedules with associated participants and alerts;
* "Resources" (personnel, facilities, equipment) to deliver a specific service during the event;
* "Subscribers" (personnel, facilities, equipment) to receive services during the event.&#x20;

The internal storage of the Scheduler Building Block MUST hold configuration, status, and logged information of all scheduled events. It MUST also maintain a repository of details of resources and subscribers affiliated with various events

The Key digital functionalities that are considered within the current scope of the specifications to support the automation of event management in different phases are listed below:

**4.1.1 Event Management:**  Authorized organizers of a host entity (such as health workers/admins/etc.)must be able to create and manage schedules of events involving several resources, subscribers, and activities that have to be reminded/triggered/informed through alerts at appropriate times before/during/after the event. Each event schedule will contain under a unique Event\_Id, details such as a description of the event, which entity is hosting the event, when is the event starting and ending, how many subscribers are allowed, terms of subscription, current status of the event, deadlines for getting attendance from participants, etc. Schedules of multiple events can be configured, tracked, and managed, avoiding any duplication.&#x20;

**4.1.2 Entity Management:**  The Scheduler must enable the adminstrator of the building block to register multiple entities that will use the scheduler. Each entity will have atleast one personnel registered under "resources" as Organizer of various events hosted by that entity. An entity may have multiple affiliated resources that can be allocated to different events hosted by the entity. The Scheduler must enable registration of details about registered entities with duplication avoidance.

**4.1.3 Alert\_Schedule Management:** Authorized organizers of a host entity may schedule one or more alerts messages to be sent to specific resources/subscribers of an event before, during, or after an event. It also provides for the mechanism to send alert messages according to the preferred Alerting mode (through Information Mediator to a target Building block/application URL end point, or publish it in its local IM+PUBSUB module or through messaging Building Block. Every alert sent is tagged for tracking status updates from alerted parties (for example an event started/ended/no show/etc.). **** Each alert sent is tagged with a unique token from Scheduler that can be used to relate responses from recipients of the alerts. The alerted Building Block/app can take appropriate actions based on the alert message and may send attendance/status to an endpoint on the scheduler along with the token. The scheduler can also poll for status updates, by giving the unique token of a specific alert it sent.

**4.1.4 Alert\_Message Management:** It must be possible for an entity to have its own stack of ready-made message templates that be reused in one or more notifications in multiple events hosted by that entity. Typically organizers of the event are maintain this stack of alert templates (reminders/updates/etc) under specific categories aligned to their business needs. The alerts may further be tagged with a category (appointment reminders/ activity triggers/ etc.) for easy search and identification purposes

**4.1.5 Resource management:** Authorized organizers of a host entity may enroll different resources resource (persons, facilities, equipment, vehicle, etc.)into respective entities. This scheduler retains the Resource details such as its name, category (doctor/nurse/teacher/health worker/admin/etc.), contact details (phone/mail/URL), etc., as needed for communication, against a unique event id for each Resource. Organizers may search for resources that are free (unallocated) together in a chosen date-time range, or look for time zones when chosen resources are free together. The scheduler allows multiple entities to register the same resource supported by de-duplication filter from the scheduler to avoid replicas in storage.

**4.1.6 Subscriber management:** The subscriber is details of person/equipment/facility identified by a name and contact details. The scheduler enables registration of new subscribers by storing their profile and contact information against a unique Id in such a way the same subscriber details can be reused for subscription to several events. Subscribers may also be tagged to a category such as student/ patient /beneficiary/etc.

**4.1.7 Affiliation Management:** The Scheduler must enable the same resource to be affiliated with multiple entities with non-overlapping weekdays and working hours. (e.g. a doctor may work at different hospitals on specific days and time spans). The organizer may allocate resources of their entity into multiple non-overlapping events within the affiliated time zone of their entity for that resource. (e.g. a doctor could provide consultation to a series of patients during their work hours at a specific hospital).&#x20;

**4.1.8 Appointment management:** This key digital functionality enables enrolment of registered subscribers into a specific event.  The same subscriber may be enrolled with different token ids into different events. In case the subscriber is a person, the person can subscribe into a chosen event or take assistance from an authorized third party (e.g. health worker or a call-center admin) to subscribe him/her self or their application/device that represents them as a participant subscriber into a chosen event.&#x20;

**4.1.9 Status Logging and Reporting:** This key digital functionality maintains logs of user-driven transactions, activities originating from this Building Block as well as status updates coming from external sources. All logs contain a date time stamp, an optional location stamp, details of the information source, and the status of transaction. For example, the Scheduler can log all alerts it generates and all events that are created/updated/cancelled. It can also log status updates from external Building Blocks or applications (e.g. completion of an event) coming through Information Mediator, Pub/Sub, or Messaging Building Block interfaces. The scheduler must enable an authorized administrator to get report of logged information in a chosen category and date range and category across events. The Scheduler does not retain any reports. The Scheduler may also monitor and log internal metrics (e.g. latency/capacity utilization/communication failures/etc.) to help in maintenance and capacity management depending on needs of implementation.  For example, if an alert recipient does not acknowledge within a fixed duration the scheduler may designed to resend the trigger/notification for a given number of retries before logging a communication success or failure. In another implementation, the scheduler may be designed to monitor the logs and mark the participant as absent an attendance log did not arrive within a certain duration after the alert was sent. These are implementation specific details that are not specified here.

**4.1.10 Information mediator interface:**  This interface handles protocols to  interact with the information mediator building block in order to securely expose  scheduler services to other building blocks and also enables scheduler access services of other building blocks and applications through the information mediator building block.

**4.1.11 Messaging interface:** The interface handles protocols to interact with the messaging building block for sending alerts to event participants and receive incoming messages through the messaging building block. This maintains internal queue of messages until they are passed on to the messaging building block.

**4.1.12 Pub-Sub Interface:**  The interface handles protocols to interact with PubSub messaging rooms assigned to publish asynchronous messages to event participants and receive incoming messages published by participants in the PubSub rooms of host application.&#x20;

**4.1.13 Building block administration:** This key digital functionality enables setting up of internal configuration requirements that define the technical behavior of the building block. It also provides for a building-block administrator to monitor and take actions that regulate the usage and performance of the building block. This also provides functionalities for registration of new entities and Event Organizers within those entities.

## **4.2 Out of scope** <a href="#_heading-h.qsh70q" id="_heading-h.qsh70q"></a>

The Scheduler Building Block will provide the following key digital functionalities to support the automation of event management in different phases:

4.2.1 The Scheduler can be used to trigger activities based on time only. Evaluation of any criteria other than time-based evaluations for the generation of a trigger is out of scope.&#x20;

4.2.2 Alerts based purely on human decision are out of scope.

4.2.3 Any logical evaluations prior to the onset of alerting applications or building blocks are out of scope. The application/Building Block MUST implement its own logic to evaluate other conditions before taking action based on an alert. (e.g., the accounts application may check whether a payroll has been approved before initiating payments when alerted by the scheduler to initiate salary payments).&#x20;
