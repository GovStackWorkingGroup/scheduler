---
description: This section lists the technical capabilities of this Building Block.
---

# 6 Functional Requirements

## Internal functional components

A common set of unique internal functional components are required to orchestrate the services of the Scheduler Building Block as shown below. The REST API's interfaces route service requests to/from external Building Blocks and appropriate internal blocks in appropriate formats. A brief description of the generic functionality of each of these components has been given below from a minimum viable product perspective. Detailed design and feature lists of these blocks can be customized by developers to optimally match specific target implementation needs.

<table data-view="cards"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td></td><td>     Event Management</td><td></td></tr><tr><td></td><td>   Resource Management</td><td></td></tr><tr><td></td><td>  Subscriber Management</td><td></td></tr><tr><td></td><td>       Alert Management</td><td></td></tr><tr><td></td><td>     Tracking and Alerting</td><td></td></tr><tr><td></td><td>          Administration</td><td></td></tr><tr><td></td><td>       Pub/Sub Interface</td><td></td></tr><tr><td></td><td>      Messaging Interface</td><td></td></tr><tr><td></td><td>Information Mediator Interface</td><td></td></tr></tbody></table>

### 1. Event management&#x20;

* The Scheduler MUST enable an event organizer to create/update/delete/modify/list schedule details of multiple events.&#x20;
* Each event MUST have a specified starting and ending date-time of an event,  at least one subscriber and at least one alert message to be notified to the subscriber.&#x20;
* An event MAY have multiple subscribers and resources participating and multiple messages to be sent at specific date-times before/during/after the event to specific subscribers and resources.&#x20;
* This Building Block must enable setting up an Event as a placeholder in advance with placeholders and later specific resources, alerts, and subscribers may be added subsequently.&#x20;
* It MUST be possible to also feed any details already known during the creation of the new event schedule.&#x20;
* An event schedule MUST allow setting up in advance with placeholders and later specific resources, alerts, and subscribers may be added subsequently.&#x20;
* It MUST be possible to also feed any details already known during the creation of the new event schedule.
* The Scheduler MUST not allow the addition/modification of any details of an event after the scheduled event is over.
* In case of events workshops, training sessions, medical camps, marketplace exhibitions, etc., that may host repeated events at different places by different resources for different subscribers, the Events could have the same name, but each instance would have a unique ID. The scheduler MUST not allow events with the same name and same host entity to overlap at the same date-time epochs.
* Building Blocks/applications MAY asynchronously update the status of an event to the Scheduler in three possible ways, proactively through call-back end points of the Scheduler or through Information Mediator Pub/Sub modules of triggered Building Blocks or in response to a status polling request to triggered resource from the Scheduler.

### 2. Resource management

* The Scheduler MUST enable an event organizer to create/update/modify/list multiple Resources (persons/facilities/equipment/vehicles/etc.) as needed for taking part in various events.  All the details about the Resource MUST be stored in a common internal repository so that the resources may be affiliated with multiple entities and booked into multiple events as needed.
* A Resource MUST be affiliated with at least one entity with specific working hours during registration. Subsequently, the same Resource may be affiliated into multiple entities such that the weekdays and working hours allocated to affiliated entities do not overlap with each other. &#x20;
* Each Resource MUST be defined with a specific category (doctors/nurses/ambulance/meeting room/ etc.) that helps in the grouping, searching, and selection of the resource.
* Contact details of Resource (email/SMS/webhook/etc. along with a default option) MUST be registered along with the Resource. &#x20;
* A Resource may be booked into multiple non-overlapping. The event slots for booking a resource MUST be restricted to the working hours of the resource in a specific entity the Resource is registered into. **** &#x20;

### 3. Subscriber management&#x20;

* The Scheduler MUST enable an event organizer to create/update/modify/list subscribers (persons/facilities/equipment/vehicles/etc.)  as needed for taking part in various events. All the details about the subscriber MUST be stored in a common internal repository so that the subscribers may be enrolled into multiple events as their contact details be reused to send alerts as needed.
* A Subscriber may be affiliated with multiple Events that do not overlap with each other in date-time.&#x20;
* Contact details of subscriber (email/sms/webhook/etc. along with default option) MUST be registered along with the subscriber.&#x20;

### 4. Alert Management

* The Scheduler MUST enable an event organizer to create/update/delete/modify/list Alert message templates that can be reused in multiple events. ( e.g. appointment reminders to various patients, triggering periodic transfer of salaries, etc.). &#x20;
* The Scheduler MUST enable an event organizer to create/update/delete/modify/list multiple Alert schedules associated with an event. Each alert schedule MUST which subscribers and resources should be notified at epoch (date-time) using whichever alert message template. All scheduled alerts of one or more events are stored in a common Alert\_List.
* Scheduler MUST have the capability to send alerts tagged to a specific token number to targets either directly to a Rest-API of target building block or through Messaging building block or through its IM building block Pub-Sub room. The choice is an implementation time decision, but it is preferred to use direct alerting sparingly for synchronous (time-critical) alerts, other asynchronous alerts can use  Messaging Building Block based alerts suited for endpoints on mobile client apps, while pub-sub should be chosen only when it is okay the art has no control of who should read it in Pub/Sub room.
* &#x20;Recipients of such alerts MAY return acknowledgement of the alert and further status updates to the scheduler in any of the following possible ways (with the token number as reference):
  * proactive updates from application of alerted participants either directly to Schedule or through its respective Information Mediator Pub/Sub;&#x20;
  * in response to a status polling request from the Scheduler to the alerted participant.&#x20;

### 5.  Tracking and Alerting <a href="#_heading-h.3j2qqm3" id="_heading-h.3j2qqm3"></a>

* The Scheduler internally MUST track and initiate sending of appropriate alert messages at specified date-time epochs to the Resources and Subscribers specified in the alert configuration for respective specific events.
* The alert messages will be routed to appropriate channels (email/SMS/URL) to corresponding end-points indicated in the resource/subscriber registry.
* The tracker MUST log all alerts sent including acknowledgements received and delivery confirmations.&#x20;
* The Scheduler MAY also receive attendance updates from any subscriber and resource and update them in the appropriate log.

### 6. Logging and Reporting

* This sub-block MUST periodically log specified internal metrics (e.g. latency, queue depth, errors, system resource consumption, number of retries, etc. from critical indicators of performance of the Scheduler Building Block).&#x20;
* This sub-block MUST internally monitor logged indicators, detect anomalies and escalate reports to administrators for timely housekeeping, capacity management, backup, and audit purposes.&#x20;
* This sub-block MUST enable organizers, auditors, administrators to query specific metrics, trends, and statistics from the logged data and get reports accordingly.&#x20;

### &#x20;7. Administration

* This component MUST enable to Building Block admins to configure rules for monitoring, detection, and escalation of any performance/security conditions to the administrator proactively.  The exact parameters and statistical indicators may be decided at implementation time.
* This sub-block MUST enable setup and updates of various end-point addresses (Information Mediator/other Building Blocks/PubSub/Applications/etc.) and associated communication settings such as back-off mechanisms, error handling, network breakdown resilience mechanisms, latency limits, etc. stored in various interfaces of the Building Block.
* This sub-block MAY provide native user interfaces to administrators of this Building Block through an API Gateway, as decided during implementation time. &#x20;

### 8. Information Mediator Interface

* This sub-block runs protocols to communicate with the information mediator Building Block for exposing scheduler services to external Building Blocks and applications.
* It also provides specific calls to APIs of information mediator Building Block to access services of external applications and Building Blocks.&#x20;
* It also handles any errors and failures in data exchange between the Scheduler and other Building Blocks/Apps (such as backoff and retries, etc.).
* It routes error information if any to the logger sub-block.&#x20;
* It maintains a list of endpoint addresses of Information Mediator, other Building Blocks, and Applications.

### 9. Pub/Sub interface

* This sub-block MUST provide a mechanism for the Scheduler Building Block to publish alerts and other messages to other Building Blocks through specific rooms in a Pub/Sub Building Block.
* It MUST enable the Scheduler to subscribe with Pub/Sub rooms of other Building Blocks (such as messaging, Accounting, payments, etc,) for example, to receive status updates on the completion of an ongoing event).&#x20;
* It MUST also use the logging sub-block to maintain history of Pub/Sub transactions handled by the Scheduler Building Block.
* This Block Should maintain endpoint address of specific rooms dedicated to the scheduler Building Block to publish Alert notifications.&#x20;

### &#x20;**10.** Messaging interface

* The messaging interface SHOULD provides the necessary protocol, data format, and information and interface to interact with the Messaging Building Block for sending notifications to specific target users/applications through a variety of channels (SMS/email/etc.)&#x20;
* This sub-block SHOULD also route response messages coming through the Messaging Building Block from users/applications to update the status of specific events.
* It SHOULD send relevant information to the logging sub-block to maintain history of all messaging transactions of this Building Block, which are useful for audit purposes.

### 11. Entity management

* This sub-block MUST enable registration of new entities that may host events using the Scheduler.&#x20;
* When a new resource/alert/event is registered, if the Scheduler finds that the associated host is not specified, it MUST prompt the user to register the entity first before trying to enroll alert/event/resource under an entity. For subscribers, the entity is an optional field and may be left blank without a specific affiliation
* When a new resource/alert/subscriber event is registered, if the scheduler finds that a specified host entity is not found in the entity list. it MUST prompt the user to register the entity first before trying to enroll alert/event/resource under an entity.
