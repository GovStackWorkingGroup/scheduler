---
description: This section lists the technical capabilities of this Building Block.
---

# 6 Functional Requirements

The Scheduler can be visualized as a black box with all key digital functionalities discussed in section 4 built-in and all interactions with the building block happening through RESTful API interfaces that exchange service requests and responses with external Building Blocks or Applications. A brief description of the functional requirements required to orchestrate each key digital functionality is  been given below, considering a minimum viable product perspective. Detailed design and more elaborate feature lists of these blocks can be customized by developers to optimally match respective  implementation needs. It is also left to the application to receive the responses from the scheduler and present it appropriately (e.g. as an Event list or calendar) and provision for associated user interface interactions

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
* Recipients of alerts may send acknowledgements and participants, in general, may send status/attendance updates either directly to Scheduler or through respective Information Mediator Pub/Sub blocks or in response to a status polling request from the Scheduler to the alerted participant. The Scheduler must log all alerts sent and log updates received from participants of all events it handles and store them in a searchable indexed manner (REQUIRED)
* This sub-block must periodically monitor and log specified internal metrics (e.g. latency, queue depth, errors, system resource consumption, number of retries, etc. from critical indicators of the performance of the Scheduler Building Block).(REQUIRED)
* This sub-block must internally check logged indicators, detect anomalies and escalate reports to administrators for timely housekeeping, capacity management, backup, and audit purposes (REQUIRED)
* This sub-block must enable organizers, auditors, and administrators to query specific metrics, trends, and statistics from the logged data and get reports accordingly (REQUIRED)
* All logged messages should have information about their category, date-time and optionally location stamp, who from which entity is logging, etc. (RECOMMENDED)
* The payload size and categories of logged messages may be specified based on the implementation needs and not specified here (OPTIONAL)
* Recipients of alerts may send acknowledgements and participants, in general, may send status/attendance updates either directly to Scheduler or through respective Information Mediator Pub/Sub blocks or in response to a status polling request from the Scheduler to the alerted participant. The Scheduler must log all alerts sent and log updates received from participants of all events it handles and store them in a searchable indexed manner (REQUIRED)
* This sub-block must periodically monitor and log specified internal metrics (e.g. latency, queue depth, errors, system resource consumption, number of retries, etc. from critical indicators of the performance of the Scheduler Building Block).(REQUIRED)
* This sub-block must internally check logged indicators, detect anomalies and escalate reports to administrators for timely housekeeping, capacity management, backup, and audit purposes (REQUIRED)
* This sub-block must enable organizers, auditors, and administrators to query specific metrics, trends, and statistics from the logged data and get reports accordingly (REQUIRED)
* All logged messages should have information about their category, date-time and optionally location stamp, who from which entity is logging, etc. (RECOMMENDED)
* The payload size and categories of logged messages may be specified based on the implementation needs and not specified here (OPTIONAL)

### 6.9 Status Logging and Reporting

* Recipients of alerts may send acknowledgements and participants, in general, may send status/attendance updates either directly to Scheduler or through respective Information Mediator Pub/Sub blocks or in response to a status polling request from the Scheduler to the alerted participant. The Scheduler must log all alerts sent and log updates received from participants of all events it handles and store them in a searchable indexed manner (REQUIRED)
* This sub-block must periodically monitor and log specified internal metrics (e.g. latency, queue depth, errors, system resource consumption, number of retries, etc. from critical indicators of the performance of the Scheduler Building Block).(REQUIRED)
* This sub-block must internally check logged indicators, detect anomalies and escalate reports to administrators for timely housekeeping, capacity management, backup, and audit purposes (REQUIRED)
* This sub-block must enable organizers, auditors, and administrators to query specific metrics, trends, and statistics from the logged data and get reports accordingly (REQUIRED)
* All logged messages should have information about their category, date-time and optionally location stamp, who from which entity is logging, etc. (RECOMMENDED)
* The payload size and categories of logged messages may be specified based on the implementation needs and not specified here (OPTIONAL)
