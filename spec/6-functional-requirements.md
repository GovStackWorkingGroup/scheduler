---
description: This section lists the technical capabilities of this Building Block.
---

# 6 Functional Requirements

## Internal functional components

Considering the various key digital functionalities of this building block discussed in section 4, a common set of non-redundant internal functional components have been identified (shown below), as required to orchestrate the services of the Scheduler Building Block accordingly.  RESTful API interfaces exchange service requests and responses with associated data between external Building Blocks/Applications and appropriate internal blocks in appropriate formats.&#x20;

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th></th><th></th></tr></thead><tbody><tr><td></td><td>     Event Management</td><td></td><td></td><td></td></tr><tr><td></td><td>   Appointment Management</td><td></td><td></td><td></td></tr><tr><td></td><td>   Resource Management</td><td></td><td></td><td></td></tr><tr><td></td><td>  Subscriber Management</td><td></td><td></td><td></td></tr><tr><td></td><td>Alert message Management</td><td></td><td></td><td></td></tr><tr><td></td><td>          Affiliation Management</td><td></td><td></td><td></td></tr><tr><td></td><td>          Affiliation Management</td><td></td><td></td><td></td></tr><tr><td></td><td>       Pub/Sub Interface</td><td></td><td></td><td></td></tr><tr><td></td><td>      Messaging Interface</td><td></td><td></td><td></td></tr><tr><td>Information Mediator Interface</td><td></td><td></td><td></td><td></td></tr><tr><td>Entity Management</td><td></td><td></td><td></td><td></td></tr><tr><td>logging and reporting</td><td></td><td></td><td></td><td></td></tr><tr><td>Administration</td><td></td><td></td><td></td><td></td></tr></tbody></table>

A brief description of the functional requirements for each of these components has been given below considering a minimum viable product perspective. Detailed design and more elaborate feature lists of these blocks can be customized by developers to optimally match respective  implementation needs. It is also left to the application consuming the response to present it appropriately (e.g. as an Event list or calendar) and provision for associated user interface interactions.

### 6.1. Event management&#x20;

6.1.1  The Scheduler MUST enable an event organizer to create/update/delete/modify/search and list schedule details of multiple events. The Scheduler MUST enable setting up in advance with minimum of a specified starting and ending date-time of an event, an event name and category and placeholders for other details that can be populated later on.&#x20;

6.1.2  It MUST be possible to also modification of event details after registration of the new event schedule in Scheduler's Event List.

6.1.3  The Scheduler MUST not allow the addition/modification of any details of an event after the scheduled event is over.

6.1.4  In case of events such as workshops, training sessions, medical camps, marketplace exhibitions, etc., that may host repeated events at different places by different resources for different subscribers, the Events could have the same name, but each instance would have a unique ID. The scheduler MUST not allow events with the same name and same host entity to overlap at the same date-time epochs.

6.1.5 It MUST be possible to find details of all events in a chosen date-time range, filtered by a given category, having specific resource and still open for subscription

6.1.6  If an event is deleted, the Scheduler must remove all dependent appointments of resources and subscribers and all scheduled alerts associated with an event and notify the organizer of the host entity.&#x20;

6.1.7 The Scheduler should sent notifications to all resources and subscribers when an associated event is deleted.



### &#x20;6.2. Resource management

6.2.1  The Scheduler MUST enable an event organizer to create/update/modify/search and list multiple Resources (persons/facilities/equipment/vehicles/etc.) as needed for taking part in various events.&#x20;

6.2.2  All the details about the Resource MUST be stored in a common internal repository so that the resources may be affiliated with multiple entities and booked into multiple events as needed.

6.2.3  Each Resource MUST be defined with a specific category (doctors/nurses/ambulance/room/ etc.) that helps in the grouping, searching, and selection of the resource.

6.2.4  Contact details of Resource (email/SMS/webhook/etc. along with a default option) MUST be registered along with the Resource.  &#x20;

6.2.5  The Scheduler MUST generate a unique id for each new resource registered, which is independent of which events the resources participates in. This is need to uniquely find and reuse details of the resource for various events as needed.

6.2.6  the preferred mode of communication (mail/sms/url) with the resource must be captured along with corresponding contact details

6.2.7  It must be possible to identify free(unallocated) time zones  in a given date-time range for a chosen resource limited by the resource's affiliated work day/hours in a given host entity.

6.2.8. The Scheduler MUST convey resource id to specific resource upon registration&#x20;

6.2.9.  The Scheduler MUST delete all affiliations and future appointments of a resource that is deleted. In real world implementation a resource may be just deactivated instead of actual  deletion.

6.2.10 If a Resource is deleted, the corresponding resource and Organizers of all affiliated entities must be notified about the deletion. In real world implementation, a resource may be de-affiliated in a particular entity, instead of deletion from resource registry.

### **6.3. Affiliation Management:**

6.3.1  The Scheduler MUST enable an event organizer to create/update/delete/list affiliation of the organizer's entity with multiple Resources (persons/facilities/equipment/vehicles/etc.) as needed for various events hosted by that entity. &#x20;

6.3.2  All the details about the Resource MUST be stored in a common internal repository so that the resources may be affiliated with multiple entities and booked into multiple events as needed.

6.3.3  A Resource MUST be affiliated with at least one entity with specific working hours during registration. Subsequently, the same Resource may be affiliated into multiple entities such that the weekdays and working hours allocated to affiliated entities do not overlap with each other.&#x20;

6.3.4  The event slots for booking a resource MUST be restricted to the working hours of the resource in a specific entity the Resource is registered into. &#x20;

6.3.5  A Resource MAY be booked into multiple entities with different affiliation ids as long as they have non-overlapping working hours and days for that resource. However, the Resource id shall be same in all such affiliations

6.3.6. If an Affiliation is deleted, the corresponding resource and entity's Organizer must be notified about the deletion.



### 6.4. Subscriber management&#x20;

6.4.1  The Scheduler MUST enable an event organizer to create/update/modify/search and list subscribers (persons/facilities/equipment/vehicles/etc.)  as needed for taking part in various events.&#x20;

6.4.2  All the details about the subscriber MUST be stored in a common internal repository so that the subscribers may be enrolled into multiple events as their contact details be reused to send alerts as needed.

6.4.3  A Subscriber MAY be affiliated with multiple Events that do not overlap with each other in date-time.&#x20;

6.4.4  Contact details of subscriber (email/sms/webhook/etc. along with default option) MUST be registered along with the subscriber.&#x20;

6.4.5  The Scheduler MUST generate a unique id for each new subscriber registered, which is independent of which events the subscribers participates in. This is need to uniquely find and reuse details of the subscriber for various events as needed.

6.4.6 The Scheduler MUST convey subscriber id to specific subscriber upon registration&#x20;

6.4.7 If a subscriber is deleted the Scheduler MUST delete all future appointments of the  subscriber. In real world implementation a subscriber may be just deactivated instead of actual  deletion.

### 6.5. Alert Message Management

6.5.1  The Scheduler MUST enable an event organizer to create/update/delete/modify/list Alert message templates that can be used to communicate with participants of events. ( e.g. appointment reminders to various patients, triggering periodic transfer of salaries, etc.). &#x20;

6.5.2  Alert messages must be tagged to a specific host entity and is not accessible to other entities. Each entity must retain its own stack of alert message templates.

6.5.3  All the details about the message MUST be stored in a common internal repository so that the messages may be reused into multiple events in high throughput environments

The Scheduler MUST generate a unique id for each new message registered, which is independent of which events the message is used in. This is need to uniquely find and reuse details of the message for various events as needed.

6.5.4  In current scope only textual messages are considered as content of the templates.&#x20;

6.5.5  Scheduler MUST have the capability to send alerts tagged to a specific token number to targets either directly to a Rest-API of target building block or through Messaging building block or through its IM building block Pub-Sub room. The choice is an implementation time decision, but it is preferred to use direct alerting sparingly for synchronous (time-critical) alerts, other asynchronous alerts can use  Messaging Building Block based alerts suited for endpoints on mobile client apps, while pub-sub should be chosen only when it is okay the art has no control of who should read it in Pub/Sub room.

6.5.5 If an alert message template is deleted, the Scheduler must delete the bindings to any future events and notify organizer of the entity about the deletion

### 6.6.  Alert Schedule Management <a href="#_heading-h.3j2qqm3" id="_heading-h.3j2qqm3"></a>

6.6.1 The Scheduler MUST enable an organizer to create/update/delete/search and list alert\_schedules for sending of alert messages in association with a specific event. A single alert schedule specifies details of only one epoch of sending a specific message to a specific category of participants of a single event.&#x20;

6.1.2  Each alert schedule MUST enable sending of the same message to multiple targets (resources / subscribers / both) of a specific event. &#x20;

6.6.3  The Scheduler MUST assign a unique Id to each alert schedule.&#x20;

6.6.4  The Scheduler MUST NOT allow reuse of an alert scheduler either in the same or another event&#x20;

6.6.5  All the details about the alert schedules MUST be stored in a common internal repository so that the alerts may be sent into multiple targets in high throughput environments

6.6.6  The Scheduler MUST enable an organizer to configure a specific date-time before/during/after the event.

6.6.7  The scheduler must enable the Organizer to choose if the alert should target either all subscribers or all resources or both type of participants in a specific event.&#x20;

6.6.8  The Scheduler MUST track alert schedules and initiate sending of appropriate alert messages at specified date-time epochs to the Resources and Subscribers accordingly

6.6.9  The alert messages MUST be composed with associated supplementary information (e.g. who is sending, for which event, what category of message, etc.) along with corresponding contact information and routed to appropriate channels (information mediator/messaging BB / PubSub)&#x20;

6.6.10 If an alert schedule is deleted, the Scheduler must remove the alert schedule from all its associated events and notify the organizer of the Host entity of the event

### 6.7. Monitoring, Logging and Reporting

6.7.1  Recipients of alerts MAY send acknowledgements and participants in general MAY send status/attendance updates  either directly to Scheduler or through respective information Mediator Pub/Sub blocks or in response to a status polling request from the Scheduler to the alerted participant. The Scheduler MUST log all alerts sent and log updates received from participants of all events it handles and store it in a searchable indexed manner.&#x20;

6.7.2  This sub-block MUST periodically monitor and log specified internal metrics (e.g. latency, queue depth, errors, system resource consumption, number of retries, etc. from critical indicators of performance of the Scheduler Building Block).&#x20;

6.7.3  This sub-block MUST internally check logged indicators, detect anomalies and escalate reports to administrators for timely housekeeping, capacity management, backup, and audit purposes.&#x20;

6.7.4  This sub-block MUST enable organizers, auditors, administrators to query specific metrics, trends, and statistics from the logged data and get reports accordingly.&#x20;

6.7.5  All logged messages should have information about its category, datetime and optionally location stamp, who from which entity is logging, etc.

6.7.6  The payload size and categories of logged messages MAY be specified based on the implementation needs and not specified here.

### &#x20;6.8. Administration

6.8.1  This component MUST enable to Building Block admins to configure rules for monitoring, detection, and escalation of any performance/security conditions to the administrator proactively.  The exact parameters and statistical indicators may be decided at implementation time.

6.8.2  This sub-block MUST enable setup and updates of various end-point addresses (Information Mediator/other Building Blocks/PubSub/Applications/etc.) and associated communication settings such as back-off mechanisms, error handling, network breakdown resilience mechanisms, latency limits, etc. stored in various interfaces of the Building Block.

6.8.3  This sub-block MAY provide native user interfaces to administrators of this Building Block through an API Gateway, as decided during implementation time. &#x20;

### 6.9. **Information mediator interface:**

6.9.1  This sub-block runs protocols to communicate with the information mediator Building Block for exposing scheduler services to external Building Blocks and applications.

6.9.2  It also provides specific calls to APIs of information mediator Building Block to access services of external applications and Building Blocks.&#x20;

6.9.3  It also handles any errors and failures in data exchange between the Scheduler and other Building Blocks/Apps (such as backoff and retries, etc.).

6.9.4  It routes error information if any to the logger sub-block.&#x20;

6.9.5  It maintains a list of endpoint addresses of Information Mediator, other Building Blocks, and Applications.

6.9.6  These are dedicated  API interfaces defined in the Information mediator building block and hence not defined here

### **6.10. PubSub Interface:**

6.10.1  These are dedicated API interfaces defined in the Pub-sub (Informediator building block ) and hence not defined here&#x20;

6.10.2  This Block Should maintain endpoint address of specific rooms dedicated to the scheduler Building Block to publish Alert notifications.

6.10.3  It MUST also use the logging sub-block to maintain history of Pub/Sub transactions handled by the Scheduler Building Block.

6.10.4  It MUST enable the Scheduler to subscribe with Pub/Sub rooms of other Building Blocks (such as messaging, Accounting, payments, etc,) for example, to receive status updates on the completion of an ongoing event).&#x20;

6.10.5  This sub-block MUST provide a mechanism for the Scheduler Building Block to publish alerts and other messages to other Building Blocks through specific rooms in a Pub/Sub Building Block.

### **6.11. Messaging interface:**

6.11.1  These are dedicated API interfaces defined in the messaging building block and hence not defined here

6.11.2  It SHOULD send relevant information to the logging sub-block to maintain history of all messages sent from this Building Block, which are useful for audit purposes.

6.11.3  This sub-block SHOULD also route response messages coming through the Messaging Building Block from participant users/devices/applications for updating of the status/ attendance/etc. of specific events. The scheduler should publish an endpoint for receiving notifications from messaging building block and a log-list to log all messages received.

6.11.4  The messaging interface SHOULD provides the necessary protocol, data format, and information and interface to interact with the Messaging Building Block for sending notifications to specific target users/applications through a variety of channels (SMS/email/etc.)&#x20;

### 6.12. Entity management

6.12.1  This sub-block MUST enable event administrators to create/update/delete/search and list entities that host various event schedules using the scheduler. &#x20;

6.12.2  All the details about the entity MUST be stored in a common internal repository so that the resources may be affiliated with multiple entities and booked into multiple events as needed.

6.12.3  An entity must have at least one affiliated resource in the Organizer role to manage event scheduling on behalf of the entity. An entity may affiliate with multiple registered resources.

6.12.4  When a new resource or alert or event is registered, if the Scheduler finds that the entity is already registered,  it MUST prompt the user and avoid duplication of the registration. An Entity MUST have a unique single id against its registration in the scheduler

### 6.13. Appointment management:&#x20;

6.13.1 This sub block MUST enable  an event organizer to add/modify/delete/search and list specific participants (resources and subscribers) into specific predefined events.  Each new appointment will have a unique appointment id.

6.13.2  All resources MUST have been registered in scheduler and MUST have been affiliated to specific entities before they can be enrolled in different events

6.13.3  All actors, except the super-admin can access information from only entities that the actor is  affiliated with in the Scheduler.

6.13.4  The scheduler MUST validate that specified resources, subscribers and events are  pre-registered in the system before they are bound together.

6.13.5  The Scheduler MUST map a single appointment to a single resource or subscriber as a participant for a single event and given a unique appointment id.&#x20;

6.13.6  The Scheduler MUST enable  single resource/subscriber may have multiple appointments for different events with respective ids&#x20;

6.13.7  The Scheduler MUST not allow duplicate entry of same resource or subscriber for the same event.&#x20;

6.13.8  Once a resource or a subscribers registered in the scheduler (this is a unique id, independent of any event or appointment), same id is used as Participant Id in whichever appointments that the given resource/subscriber participates.&#x20;

6.13.9 The respective participant (subscriber/resource) organizer of the host-entity must be notified if an appointment is cancelled.&#x20;

6.13.10  Participants of an event must send ids of the event and appointment in headers of their responses/updates sent to the scheduler through any channel (IM/PUBSUB/Messaging)
