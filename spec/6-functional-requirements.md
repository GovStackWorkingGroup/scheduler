---
description: This section lists the technical capabilities of this Building Block.
---

# 6 Functional Requirements

Considering the various key digital functionalities of this Building Block discussed in section 4, a common set of non-redundant internal functional components have been identified (shown below), as required to orchestrate the services of the Scheduler Building Block accordingly. RESTful API interfaces exchange service requests and responses with associated data between external Building Blocks/Applications and appropriate internal blocks in appropriate formats.

A brief description of the functional requirements for each of these components has been given below considering a minimum viable product perspective. Detailed design and more elaborate feature lists of these blocks can be customized by developers to optimally match respective implementation needs. It is also left to the application consuming the response to present it appropriately (e.g. as an Event list or calendar) and provision for associated user interface interactions.

### 6.1 Event Management

* The Scheduler must enable an event organizer to create/update/delete/modify/search and list schedule details of multiple events. The Scheduler must enable setting up in advance with a minimum of a specified starting and ending date-time of an event, an event name and category and placeholders for other details that can be populated later on (REQUIRED)
* It must be possible the modification of event details after registration of the new event scheduled in the Scheduler's Event List (REQUIRED)
* The Scheduler must not allow the addition/modification of any details of an event after the scheduled event is over (REQUIRED)
* In the case of events such as workshops, training sessions, medical camps, marketplace exhibitions, etc., which may host repeated events at different places by different resources for different subscribers, the Events could have the same name, but each instance would have a unique ID. The Scheduler must not allow events with the same name and same host entity to overlap at the same date-time epochs (REQUIRED)
* It must be possible to find details of all events in a chosen date-time range, filtered by a given category, having specific resources and still open for a subscription (REQUIRED)
* If an event is deleted, the Scheduler must remove all dependent appointments of resources and subscribers and all scheduled alerts associated with an event and notify the organizer of the host entity (REQUIRED)
* The Scheduler should send notifications to all resources and subscribers when an associated event is deleted (RECOMMENDED)

### 6.2 **Entity Management**

* This sub-block must enable event administrators to create/update/delete/search and list entities that host various event schedules using the Scheduler (REQUIRED)
* All the details about the entity must be stored in a common internal repository so that the resources may be affiliated with multiple entities and booked into multiple events as needed (REQUIRED)
* An entity must have at least one affiliated resource in the Organizer role to manage event scheduling on behalf of the entity. An entity may affiliate with multiple registered resources (REQUIRED)
* When a new resource or alert or event is registered, if the Scheduler finds that the entity is already registered, it must prompt the user and avoid duplication of the registration. An Entity must have a unique single id against its registration in the Scheduler (REQUIRED)

### 6.3 Alert Schedule Management <a href="#_heading-h.3j2qqm3" id="_heading-h.3j2qqm3"></a>

* The Scheduler must enable an organizer to create/update/delete/search and list alert\_schedules for sending alert messages in association with a specific event. A single alert schedule specifies details of only one epoch of sending a specific message to a specific category of participants of a single event (REQUIRED)
* Each alert schedule must enable sending of the same message to multiple targets (resources/subscribers/both) of a specific event (REQUIRED)
* The Scheduler must assign a unique Id to each alert schedule (REQUIRED)
* The Scheduler must not allow the reuse of an alert scheduler either in the same or another event (REQUIRED)
* All the details about the alert schedules must be stored in a common internal repository so that the alerts may be sent to multiple targets in high throughput environments (REQUIRED)
* The Scheduler must enable an organizer to configure a specific date-time before/during/after the event (REQUIRED)
* The Scheduler must enable the Organizer to choose if the alert should target either all subscribers or all resources or both types of participants in a specific event (REQUIRED)
* The Scheduler must track alert schedules and initiate sending of appropriate alert messages at specified date-time epochs to the Resources and Subscribers accordingly (REQUIRED)
* The alert messages must be composed with associated supplementary information (e.g. who is sending, for which event, what category of message, etc.) along with corresponding contact information and routed to appropriate channels, such as Information Mediator Building Block, Messaging Building Block, or Pub/Sub service (REQUIRED)
* If an alert schedule is deleted, the Scheduler must remove the alert schedule from all its associated events and notify the organizer of the Host entity of the event (REQUIRED)

### 6.4 Alert Message Management

* The Scheduler must enable an event organizer to create/update/delete/modify/list Alert message templates that can be used to communicate with participants of events. (e.g. appointment reminders to various patients, triggering a periodic transfer of salaries, etc.) (REQUIRED)
* Alert messages must be tagged to a specific host entity and are not accessible to other entities. Each entity must retain its own stack of alert message templates (REQUIRED)
* All the details about the message must be stored in a common internal repository so that the messages may be reused into multiple events in high throughput environments (REQUIRED)
* The Scheduler must generate a unique id for each new message registered, which is independent of which events the message is used in. This is needed to uniquely find and reuse details of the message for various events as needed (REQUIRED)
* In the current scope, only textual messages are considered as content of the templates (RECOMMENDED)
* The Scheduler must have the capability to send alerts tagged to a specific token number to targets either directly to a Rest-API of the target Building Block or through Messaging Building Block or through its Information Mediator Building Block Pub/Sub room. The choice is an implementation time decision, but it is preferred to use direct alerting sparingly for synchronous (time-critical) alerts, other asynchronous alerts can use Messaging Building Block based alerts suited for endpoints on mobile client apps, while Pub/Sub should be chosen only when it is okay the art has no control of who should read it in Pub/Sub room (REQUIRED)
* If an alert message template is deleted, the Scheduler must delete the bindings to any future events and notify the organizer of the entity about the deletion (REQUIRED)

### 6.5 Resource management

* The Scheduler must enable an event organizer to create/update/modify/search and list multiple Resources (persons/facilities/equipment/vehicles/etc.) as needed for taking part in various events (REQUIRED)
* All the details about the Resource must be stored in a common internal repository so that the resources may be affiliated with multiple entities and booked into multiple events as needed (REQUIRED)
* Each Resource must be defined with a specific category (doctors/nurses/ambulance/room/ etc.) that helps in the grouping, searching, and selection of the resource (REQUIRED)
* Contact details of Resource (email/SMS/webhook/etc. along with a default option) must be registered along with the Resource (REQUIRED)
* The Scheduler must generate a unique ID for each new resource registered, which is independent of which events the resource participates in. This is needed to uniquely find and reuse details of the resource for various events as needed (REQUIRED)
* The preferred mode of communication (mail/sms/URL) with the resource must be captured along with corresponding contact details (REQUIRED)
* It must be possible to identify free (unallocated) time zones in a given date-time range for a chosen resource limited by the resource's affiliated work day/hours in a given host entity (REQUIRED)
* The Scheduler must convey resource ID to a specific resource upon registration (REQUIRED)
* The Scheduler must delete all affiliations and future appointments of a resource that is deleted. In a real-world implementation, a resource may be just deactivated instead of actually deleted (REQUIRED)
* If a Resource is deleted, the corresponding resource and Organizers of all affiliated entities must be notified about the deletion. In a real-world implementation, a resource may be de-affiliated in a particular entity, instead of deletion from the resource registry (REQUIRED)

### 6.6 Subscriber management

* The Scheduler must enable an event organizer to create/update/modify/search and list subscribers (persons/facilities/equipment/vehicles/etc.) as needed for taking part in various events (REQUIRED)
* All the details about the subscriber must be stored in a common internal repository so that the subscribers may be enrolled into multiple events as their contact details be reused to send alerts as needed (REQUIRED)
* A Subscriber may be affiliated with multiple Events that do not overlap with each other in date-time (OPTIONAL)
* Contact details of the subscriber (email/sms/webhook/etc. along with default option) must be registered along with the subscriber (REQUIRED)
* The Scheduler must generate a unique ID for each new subscriber registered, which is independent of which events the subscribers participate in. This is needed to uniquely find and reuse details of the subscriber for various events as needed (REQUIRED)
* The Scheduler must convey subscriber ID to a specific subscriber upon registration (REQUIRED)
* If a subscriber is deleted the Scheduler must delete all future appointments of the subscriber. In a real-world implementation, a subscriber may be just deactivated instead of actually deleted (REQUIRED)

### **6.7 Affiliation Management**

* The Scheduler must enable an event organizer to create/update/delete/list affiliation of the organizer's entity with multiple Resources (persons/facilities/equipment/vehicles/etc.) as needed for various events hosted by that entity (REQUIRED)
* All the details about the Resource must be stored in a common internal repository so that the resources may be affiliated with multiple entities and booked into multiple events as needed (REQUIRED)
* A Resource must be affiliated with at least one entity with specific working hours during registration. Subsequently, the same Resource may be affiliated into multiple entities such that the weekdays and working hours allocated to affiliated entities do not overlap with each other (REQUIRED)
* The event slots for booking a resource must be restricted to the working hours of the resource in a specific entity the Resource is registered into (REQUIRED)
* A Resource may be booked into multiple entities with different affiliation IDs as long as they have non-overlapping working hours and days for that resource. However, the Resource ID shall be the same in all such affiliations (OPTIONAL)
* If an Affiliation is deleted, the corresponding resource and entity's Organizer must be notified about the deletion (REQUIRED)

### 6.8 Appointment Management

* This sub-block must enable an event organizer to add/modify/delete/search and list specific participants (resources and subscribers) into specific predefined events. Each new appointment will have a unique appointment ID (REQUIRED)
* All resources must have been registered in Scheduler and MUST have been affiliated with specific entities before they can be enrolled in different events (REQUIRED)
* All actors, except the super-admin, can access information from only entities that the actor is affiliated with in the Scheduler (RECOMMENDED)
* The Scheduler must validate that specified resources, subscribers and events are pre-registered in the system before they are bound together (REQUIRED)
* The Scheduler must map a single appointment to a single resource or subscriber as a participant for a single event and be given a unique appointment ID (REQUIRED)
* The Scheduler must enable a single resource/subscriber that may have multiple appointments for different events with respective IDs (REQUIRED)
* The Scheduler must not allow duplicate entries of the same resource or subscriber for the same event (REQUIRED)
* Once a resource or a subscriber is registered in the scheduler (this is a unique ID independent of any event or appointment), the same ID is used as Participant Id in whichever appointments in which the given resource/subscriber participates (REQUIRED)
* The respective participant (subscriber/resource) organizer of the host entity must be notified if an appointment is cancelled (REQUIRED)
* Participants of an event must send IDs of the event and appointment in headers of their responses/updates sent to the scheduler through any channel (Information Mediator Building Block/PubSub/Messaging Building Block) (REQUIRED)

### 6.9 Status Logging and Reporting

* Recipients of alerts may send acknowledgements and participants, in general, may send status/attendance updates either directly to Scheduler or through respective Information Mediator Pub/Sub blocks or in response to a status polling request from the Scheduler to the alerted participant. The Scheduler must log all alerts sent and log updates received from participants of all events it handles and store them in a searchable indexed manner (REQUIRED)
* This sub-block must periodically monitor and log specified internal metrics (e.g. latency, queue depth, errors, system resource consumption, number of retries, etc. from critical indicators of the performance of the Scheduler Building Block).
* This sub-block must internally check logged indicators, detect anomalies and escalate reports to administrators for timely housekeeping, capacity management, backup, and audit purposes (REQUIRED)
* This sub-block must enable organizers, auditors, and administrators to query specific metrics, trends, and statistics from the logged data and get reports accordingly (REQUIRED)
* All logged messages should have information about their category, date-time and optionally location stamp, who from which entity is logging, etc. (RECOMMENDED)
* The payload size and categories of logged messages may be specified based on the implementation needs and not specified here (OPTIONAL)

### 6.10 **Information Mediator Interface**

* This sub-block runs protocols to communicate with the Information Mediator Building Block for exposing Scheduler services to external Building Blocks and applications (REQUIRED)
* It also provides specific calls to APIs of information mediator Building Block to access services of external applications and Building Blocks (REQUIRED)
* It also handles any errors and failures in data exchange between the Scheduler and other Building Blocks/Apps (such as backoff and retries, etc.) (REQUIRED)
* It routes error information if any to the logger sub-block (RECOMMENDED)
* It maintains a list of endpoint addresses of Information Mediator, other Building Blocks, and Applications. These are dedicated API interfaces defined in the Information Mediator Building Block and hence not defined here (REQUIRED)

### **6.11 Pub/Sub Interface**

* This Block must maintain the endpoint address of specific rooms dedicated to the Scheduler Building Block to publish Alert notifications. These are dedicated API interfaces defined in the Pub/Sub (Information Mediator Building Block) and hence are not defined here (REQUIRED)
* It must also use the logging sub-block to maintain the history of Pub/Sub transactions handled by the Scheduler Building Block (REQUIRED)
* It must enable the Scheduler to subscribe with Pub/Sub rooms of other Building Blocks (such as Messaging, Accounting, Payments, etc.) (for example, to receive status updates on the completion of an ongoing event) (REQUIRED)
* This sub-block must provide a mechanism for the Scheduler Building Block to publish alerts and other messages to other Building Blocks through specific rooms in a Pub/Sub Building Block (REQUIRED)

### **6.12 Messaging Interface**

* The Messaging interface should send relevant information to the logging sub-block to maintain the history of all messages sent from this Building Block, which are useful for audit purposes (RECOMMENDED)
* This sub-block should also route response messages coming through the Messaging Building Block from participant users/devices/applications for updating of the status/ attendance/etc. of specific events. The Scheduler should publish an endpoint for receiving notifications from messaging Building Block and a log list to log all messages received (RECOMMENDED)
* The messaging interface should provide the necessary protocol, data format, and information and interface to interact with the Messaging Building Block for sending notifications to specific target users/applications through a variety of channels (SMS/email/etc.) (RECOMMENDED)

### 6.13 Scheduler Administration

* This component must enable Building Block admins to configure rules for monitoring, detection, and escalation of any performance/security conditions to the administrator proactively. The exact parameters and statistical indicators may be decided at implementation time (REQUIRED)
* This sub-block must enable setup and updates of various end-point addresses (Information Mediator/other Building Blocks/PubSub/Applications/etc.) and associated communication settings such as back-off mechanisms, error handling, network breakdown resilience mechanisms, latency limits, etc. stored in various interfaces of the Building Block (REQUIRED)
* This sub-block may provide native user interfaces to administrators of this Building Block through an API Gateway, as decided during implementation time (OPTIONAL)
* The administrative functions must allow an **administrator** to perform the following tasks (REQUIRED):
  * register without duplication of an entity, into its Entity List with details (e.g. name, phone, email, website, etc.). The entities host various "events" involving their affiliated resources.
  * categorize entities for easy searching and sorting. In the current scope, "Hospital", "Health ministry", and "Social welfare ministry" may be examples of entities.
  * register resources and affiliate them as "Organizers" in a specific entity for the management of events hosted by that entity.
  * configure rules for performance, security and communication management between the Scheduler and other Building Blocks, applications and event participants. The exact parameters may be decided at implementation time.
  * extract log reports from the system as needed for monitoring and administering the Building Block operations.
* The administrative functions must allow an **organizer** to perform the following tasks (REQUIRED):
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
  * enrol a registered subscriber into a predefined event to participate as a beneficiary of the event. The same subscriber may be enrolled on multiple events, but each enrollment will generate a unique appointment ID.
  * define and maintain a library of a predefined stack of messages for a specific Host entity so that it can be reused in multiple events conducted by the specific host entity.
  * define alert schedules for sending specific Alert messages associated with a specific event at a specific date-time to associated subscribers or resources or both.
  * define multiple alert schedules (before, during, after) for the same event.
  * to extract logs related to events that help in continuous improvement in event management.
  * search and extract details of one or more events, resources, subscribers, alert messages templates and logs associated with entities which the Organizer is also affiliated with.
* The administrative functions must allow a **resource** to perform the following tasks (REQUIRED):
  * search and extract their own registration details in the Scheduler.
  * search and extract their own affiliation details across associated entities.
  * search and extract details of appointments and events they are enrolled into.
  * search and extract details of subscribers of events they are enrolled into.
  * receive scheduled alert messages from events they are enrolled into.
  * search and list details of events of the chosen category, host entity in a specified date-time range.
  * log status/attendance updates related to events they are enrolled into.
* The administrative functions must allow a **subscriber** to perform the following tasks (REQUIRED):
  * search and extract their own registration details in the Scheduler Building Block.
  * search and list details of events with a chosen category, host entity and resource which are open for subscription in a specified date-time range.
  * enrol themselves into a predefined event to participate as a beneficiary of the event and obtain a corresponding unique appointment ID.
  * search and extract details of appointments and events they are enrolled into.
  * receive scheduled alert messages from events they are enrolled on.
  * log status/attendance updates related to events they are enrolled into.
* The administrative functions must automate the following functions (REQUIRED):
  * track all alert schedules and send corresponding alert messages with unique tokens to relevant participants at appropriate times.
  * log each alert sent with a date-time stamp and a unique token in the Scheduler's log that can be used later to relate responses from recipients of the alerts.
  * receive and log acknowledgement/status/attendance updates from event participants date time stamp, optional location stamp and sender information.
  * update event status (started/ended/open/closed) depending on date-time and subscriber limit.
  * poll participants for status updates, by giving the unique token of a specific alert it sent.
  * log transactions done by all actors along with actor type and ID and date time stamp. Associated implementation-specific details that are not specified here.
  * monitor and log internal metrics (e.g. latency/capacity utilization/communication failures/etc.) to help in maintenance and capacity management depending on the needs of implementation. Associated implementation-specific details that are not specified here.
  * detect communication failure with other Building Blocks and applications and perform retries according to configured rules before logging a communication failure. Associated implementation-specific details that are not specified here.
  * monitor the logs and mark the participant as absent if an attendance log did not arrive within a specified deadline. Associated implementation-specific details that are not specified here.
